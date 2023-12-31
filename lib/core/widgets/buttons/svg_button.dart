// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hanoman/core/constants/colors.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isTapped,
    this.isFilled,
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;
  final bool? isTapped;
  final bool? isFilled;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: 0,
      padding: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (isTapped ?? false) && (isFilled == null)
              ? AppColors.orange
              : null,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: SvgPicture.asset(
          icon,
          color: (isTapped ?? false)
              ? AppColors.white
              : (isFilled ?? false)
                  ? AppColors.orange
                  : AppColors.gray,
        ),
      ),
    );
  }
}
