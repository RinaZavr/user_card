import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';
import 'package:user_card/src/common/consts/styles.dart';
import 'package:user_card/src/features/user/view/widgets/card_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CardWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Container(
                padding: EdgeInsets.all(32),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                child: Icon(
                  CupertinoIcons.person,
                  size: 200,
                  color: AppColors.secondary,
                ),
              ),
              Text(
                name,
                style: AppStyles.title,
              ),
              Text(
                company,
                style: AppStyles.subtitle,
              ),
              Divider(
                color: Colors.white,
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              UserInfoWidget(
                icon: CupertinoIcons.phone,
                title: phone,
              ),
              UserInfoWidget(
                icon: CupertinoIcons.mail,
                title: email,
              ),
              UserInfoWidget(
                icon: CupertinoIcons.location,
                title: city,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
