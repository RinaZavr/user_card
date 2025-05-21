import 'package:dio/dio.dart';
import 'package:user_card/src/config/models/user_model.dart';

class UserService {
  factory UserService() {
    return UserService._();
  }

  UserService._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  Future<User?> getUser() async {
    final response = await _dio.get(
      '/users/1',
    );

    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    }
    return null;
  }
}
