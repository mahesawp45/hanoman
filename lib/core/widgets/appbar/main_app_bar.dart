import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 10),
            color: AppColors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: child,
    );
  }
}
