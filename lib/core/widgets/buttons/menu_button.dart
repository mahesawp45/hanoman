import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/font_size.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onTap,
    required this.isTapped,
  }) : super(key: key);

  final String label;
  final String icon;
  final VoidCallback onTap;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(icon, color: isTapped ? AppColors.orange : null),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: AppFontSizes.bodySmall,
              color: isTapped
                  ? AppColors.orange.withOpacity(0.7)
                  : AppColors.gray.withOpacity(0.5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
