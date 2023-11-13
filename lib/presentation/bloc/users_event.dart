part of 'users_bloc.dart';

@immutable
sealed class UserEvent {}

class FetchUsers extends UserEvent {}
