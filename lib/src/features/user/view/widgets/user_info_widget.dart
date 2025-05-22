import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';
import 'package:user_card/src/common/consts/styles.dart';
import 'package:user_card/src/config/models/user_model.dart';
import 'package:user_card/src/features/user/view/widgets/info_row_widget.dart';

/// Виджет, отображающий информацию о пользователе
class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, required this.user});

  final User user; // Данные о пользователе из Api

  @override
  Widget build(BuildContext context) {
    return Column(
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
          user.name,
          style: AppStyles.title,
        ),
        Text(
          user.company,
          style: AppStyles.subtitle,
        ),
        Divider(
          color: Colors.white,
          thickness: 2,
          indent: 50,
          endIndent: 50,
        ),
        InfoRowWidget(
          icon: CupertinoIcons.phone_solid,
          title: user.phone,
        ),
        InfoRowWidget(
          icon: CupertinoIcons.mail_solid,
          title: user.email,
        ),
        InfoRowWidget(
          icon: CupertinoIcons.location_solid,
          title: user.city,
        ),
      ],
    );
  }
}
