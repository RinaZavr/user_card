import 'package:dio/dio.dart';
import 'package:user_card/src/config/models/user_model.dart';

/// Сервис для получения данных о пользователе
class UserService {
  /// Делаем его синглтон, чтобы при повторном запросе данных,
  /// не создавался новый экземпляр класса
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  /// Создаем экземпляр Dio и определяем хост
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  /// Метод, возвращающий данные о пользователе
  Future<User?> getUser() async {
    /// Выполняем запрос
    final response = await _dio.get(
      '/users/1',
    );

    /// Если запрос успешен
    if (response.statusCode == 200) {
      /// Возвращаем распарсенные данные
      return User.fromJson(response.data);
    }
    return null;
  }
}
