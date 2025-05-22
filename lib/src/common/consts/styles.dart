import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';

/// Класс констант стилей
abstract class AppStyles {
  static const TextStyle title = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static const TextStyle normal = TextStyle(
    fontSize: 18,
    color: AppColors.primary,
  );
}
