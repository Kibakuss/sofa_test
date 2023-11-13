import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sofa/data/models/user.dart';
import 'package:sofa/data/repositories/users_repository.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository _usersRepository;

  UsersBloc(this._usersRepository) : super(UsersLoading()) {
    on<FetchUsers>(_onLoadUsers);
  }

  Future<void> _onLoadUsers(
    FetchUsers event,
    Emitter<UserState> emit,
  ) async {
    emit(UsersLoading());

    try {
      final users = await _usersRepository.getUsers();

      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(UsersLoadingFailure(exeption: e));
    }
  }
}
