import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';
import 'package:user_card/src/common/consts/styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.getUser});

  final VoidCallback getUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Не удалось загрузить данные',
          style: AppStyles.title,
          textAlign: TextAlign.center,
        ),
        TextButton(
          onPressed: getUser,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.secondary,
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
              side: BorderSide(
                color: AppColors.primary,
              ),
            ),
          ),
          child: Text(
            'Повторить',
            style: AppStyles.subtitle,
          ),
        )
      ],
    );
  }
}
