import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofa/data/models/user.dart';
import 'package:sofa/data/repositories/users_repository_impl.dart';
import 'package:sofa/presentation/bloc/photo_bloc.dart';
import 'package:sofa/presentation/widgets/photo_card.dart';
import 'package:sofa/presentation/widgets/user_info.dart';

class CardUser extends StatelessWidget {
  final User user;

  const CardUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        BlocProvider(
                          create: (context) => PhotoBloc(UsersRepositoryImpl())
                            ..add(FetchPhotos(user.id)),
                          child: const PhotoCard(),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          user.name,
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          user.company.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        UserInfo(user: user),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
