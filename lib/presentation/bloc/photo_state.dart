part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotosLoading extends PhotoState {}

final class PhotosLoaded extends PhotoState {
  final List<Photo> photos;

  PhotosLoaded({required this.photos});
}

final class PhotosLoadingError extends PhotoState {
  final Object exeption;

  PhotosLoadingError({required this.exeption});
}
