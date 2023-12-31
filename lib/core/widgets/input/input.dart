// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/font_size.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.width,
    this.label,
    this.prefixIcon,
    required this.controller,
    this.hintText,
    this.type,
    this.info,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  final double width;
  final String? label;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? type;
  final String? info;
  final int? minLines;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              label ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: AppColors.black,
            keyboardType: type,
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            ),
          ),
        ),
        Visibility(
          visible: info != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              info ?? "",
              style: TextStyle(
                fontSize: AppFontSizes.bodySmall,
                color: AppColors.gray.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
