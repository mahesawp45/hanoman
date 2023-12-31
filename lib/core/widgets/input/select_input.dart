// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hanoman/core/constants/colors.dart';

class SelectInput extends StatelessWidget {
  const SelectInput({
    Key? key,
    this.label,
    required this.initialItem,
    required this.items,
  }) : super(key: key);

  final String? label;
  final String initialItem;
  final List<DropdownMenuItem<String>> items;

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.gray.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: AppColors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.black.withOpacity(0.5),
              ),
              value: initialItem,
              items: items,
              onChanged: (val) {},
            ),
          ),
        ),
      ],
    );
  }
}
