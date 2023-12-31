import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/font_size.dart';

class InputReadDotted extends StatelessWidget {
  const InputReadDotted({
    Key? key,
    required this.width,
    required this.label,
    required this.data,
  }) : super(key: key);

  final double width;
  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: AppFontSizes.bodySmall,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        DottedBorder(
          color: AppColors.gray.withOpacity(0.1),
          strokeWidth: 1,
          radius: const Radius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: width,
            child: Text(data),
          ),
        )
      ],
    );
  }
}
