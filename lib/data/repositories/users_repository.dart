import 'package:sofa/data/models/photos.dart';
import 'package:sofa/data/models/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
  Future<List<Photo>> getAlbums(int userId);
}
