part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

class FetchPhotos extends PhotoEvent {
  final int userId;

  FetchPhotos(this.userId);
}
