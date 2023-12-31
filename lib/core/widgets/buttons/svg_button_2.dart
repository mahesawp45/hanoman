import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/colors.dart';

class SvgButton2 extends StatelessWidget {
  const SvgButton2({
    Key? key,
    required this.onTap,
    required this.icon,
    this.isTapped,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final bool? isTapped;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: 0,
      padding: EdgeInsets.zero,
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: (isTapped ?? false) ? AppColors.orange : null,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Icon(
            icon,
            color: (isTapped ?? false) ? AppColors.white : AppColors.gray,
          )),
    );
  }
}
