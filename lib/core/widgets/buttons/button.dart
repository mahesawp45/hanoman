// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hanoman/core/constants/colors.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.label,
    this.icon,
    required this.onTap,
    this.isOutlined,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final VoidCallback onTap;
  final bool? isOutlined;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: 0,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      color: isOutlined == true ? null : AppColors.blue,
      shape: RoundedRectangleBorder(
        side: isOutlined == true
            ? const BorderSide(
                color: AppColors.blue,
                width: 1,
              )
            : const BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ],
            )
          : Text(
              label,
              style: TextStyle(
                color: isOutlined == true ? AppColors.blue : AppColors.white,
              ),
            ),
    );
  }
}
