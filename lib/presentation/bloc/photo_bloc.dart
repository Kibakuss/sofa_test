import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sofa/data/models/photos.dart';
import 'package:sofa/data/repositories/users_repository.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final UsersRepository _usersRepository;
  PhotoBloc(this._usersRepository) : super(PhotosLoading()) {
    on<FetchPhotos>(_onLoadPhotos);
  }

  Future<void> _onLoadPhotos(
    FetchPhotos event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotosLoading());

    try {
      final photos = await _usersRepository.getAlbums(event.userId);

      emit(PhotosLoaded(photos: photos));
    } catch (e) {
      emit(PhotosLoadingError(exeption: e));
    }
  }
}
