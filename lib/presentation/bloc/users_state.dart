part of 'users_bloc.dart';

@immutable
sealed class UserState {}

class UsersLoading extends UserState {}

final class UsersLoaded extends UserState {
  final List<User> users;

  UsersLoaded({required this.users});
}

final class UsersLoadingFailure extends UserState {
  final Object exeption;

  UsersLoadingFailure({required this.exeption});
}
