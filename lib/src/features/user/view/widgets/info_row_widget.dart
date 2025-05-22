import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';
import 'package:user_card/src/common/consts/styles.dart';

/// Виджет для доп информации о пользователе, 
/// так как используется несколько раз, то вынесен в отдельный виджет
class InfoRowWidget extends StatelessWidget {
  const InfoRowWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Icon(
          icon,
          color: AppColors.primary,
        ),
        Text(
          title,
          style: AppStyles.normal,
        ),
      ],
    );
  }
}
