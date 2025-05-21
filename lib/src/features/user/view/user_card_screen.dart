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
  String name = 'Иванов Иван Иванович';
  String email = 'example@example.com';
  String phone = '+7 (123) 456-78-90';
  String company = 'Example Company';
  String city = 'Omsk';

  User? user;

  bool isLoading = false;
  String error = '';

  Future<void> getUser() async {
    setState(() {
      isLoading = true;
    });

    await UserService().getUser().then((value) {
      setState(() {
        user = value;
      });
    }).catchError((value) {
      setState(() {
        error = value.toString();
      });
    }).whenComplete(() {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CardWidget(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primary,
                ))
              : error.isNotEmpty || user == null
                  ? CustomErrorWidget(
                      getUser: getUser,
                    )
                  : UserInfoWidget(user: user!),
        ),
      ),
    );
  }
}
