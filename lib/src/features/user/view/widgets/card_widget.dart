import 'package:flutter/material.dart';
import 'package:user_card/src/common/consts/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        height: size.height / 1.5,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withValues(alpha: 0.2),
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.secondaryGradientFirst,
              AppColors.mainGradientFirst,
              AppColors.mainGradientSecond,
              AppColors.secondaryGradientSecond,
            ],
            stops: const [
              0.0,
              0.3,
              0.7,
              1.0,
            ],
          ),
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.8,
              ],
              colors: [
                AppColors.mainGradientFirst,
                AppColors.mainGradientSecond,
              ],
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: child,
        ),
      ),
    );
  }
}
