import 'package:flutter/material.dart';
import 'package:sofa/presentation/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofa/presentation/widgets/users_page_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UserState>(
      builder: (context, state) {
        if (state is UsersLoaded) {
          final users = state.users;
          return UsersPageView(users: users);
        } else {
          return Scaffold(
              body: state is UsersLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is UsersLoadingFailure
                      ? Center(
                          child: Text(
                              'При загрузке пользователей произошла ошибка ${state.exeption}'))
                      : const SizedBox());
        }
      },
    );
  }
}
