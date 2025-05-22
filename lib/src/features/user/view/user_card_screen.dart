import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';
import 'package:user_card/src/config/models/user_model.dart';
import 'package:user_card/src/config/services/user_service.dart';
import 'package:user_card/src/features/user/view/widgets/card_widget.dart';
import 'package:user_card/src/features/user/view/widgets/custom_error_widget.dart';
import 'package:user_card/src/features/user/view/widgets/user_info_widget.dart';

class UserCardScreen extends StatefulWidget {
  const UserCardScreen({super.key});

  @override
  State<UserCardScreen> createState() => _UserCardScreenState();
}

class _UserCardScreenState extends State<UserCardScreen> {
  /// Nullable переменная модели User, хранящая данные о пользователе с API
  /// Если данные еще не загружены или произошла ошибка, то она равна null
  User? user;

  /// Переменная, отвечающая за состояние загрузки
  /// true - данные загружаются, false - загрузка окончена
  bool isLoading = false;

  /// Переменная, хранящая текст ошибки
  /// Если ошибки нет, то она пустая
  /// Храним текст для отладки, чтобы в любой момент можно было увидеть,
  /// какая ошибка произошла
  String error = '';

  /// Метод, загружающий данные о пользователе
  Future<void> getUser() async {
    /// Перед выполнением запроса, показываем, что начали загрузку
    setState(() {
      isLoading = true;
    });

    /// Выполняем запрос
    await UserService().getUser().then((value) {
      /// Если запрос успешен, то сохраняем данные
      setState(() {
        user = value;
      });
    }).catchError((value) {
      /// Если запрос не удался, то сохраняем текст ошибки
      setState(() {
        error = value.toString();
      });
    }).whenComplete(() {
      /// Когда запрос завершен, показываем, что загрузка закончена
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    /// При инициализации экрана, загружаем данные
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CardWidget(
          child: isLoading // Если данные еще не загружены
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              // Если произошла ошибка и так как далее явно говорим, что user есть (через !), проверяем user на null
              : error.isNotEmpty || user == null
                  ? CustomErrorWidget(
                      getUser: getUser,
                    )
                  // Если закончена загрузка, ошибки нет и есть user, то показываем данные
                  : UserInfoWidget(user: user!),
        ),
      ),
    );
  }
}
