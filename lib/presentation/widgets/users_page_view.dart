import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofa/data/models/user.dart';
import 'package:sofa/data/repositories/users_repository_impl.dart';
import 'package:sofa/presentation/bloc/users_bloc.dart';
import 'package:sofa/presentation/widgets/card_user.dart';

class UsersPageView extends StatefulWidget {
  final List<User> users;
  const UsersPageView({super.key, required this.users});

  @override
  State<UsersPageView> createState() => _UsersPageViewState();
}

class _UsersPageViewState extends State<UsersPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemCount: widget.users.length,
          itemBuilder: (BuildContext context, int index) {
            return BlocProvider(
              create: (context) => UsersBloc(UsersRepositoryImpl()),
              child: CardUser(user: widget.users[index]),
            );
          },
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              if (_currentPage == 0) {
                _pageController.animateToPage(
                  widget.users.length - 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              } else {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              if (_currentPage == widget.users.length - 1) {
                _pageController.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutQuart,
                );
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ]));
  }
}
