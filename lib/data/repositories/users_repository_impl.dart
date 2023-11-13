import 'package:sofa/data/models/photos.dart';
import 'package:sofa/data/models/user.dart';
import 'package:sofa/data/repositories/users_repository.dart';
import 'package:dio/dio.dart';

class UsersRepositoryImpl implements UsersRepository {
  final Dio dio = Dio();
  @override
  Future<List<User>> getUsers() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    final users =
        (response.data as List).map((json) => User.fromJson(json)).toList();
    return users;
  }

  @override
  Future<List<Photo>> getAlbums(int userId) async {
    final response = await dio
        .get('https://jsonplaceholder.typicode.com/albums/$userId/photos');
    final photos =
        (response.data as List).map((json) => Photo.fromJson(json)).toList();
    return photos;
  }
}
