import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/colors.dart';

class InputCheck extends StatelessWidget {
  const InputCheck({
    Key? key,
    required this.value,
    required this.onChange,
    required this.label,
  }) : super(key: key);

  final bool value;
  final Function(bool) onChange;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (value) {
            onChange(value ?? false);
          },
          activeColor: AppColors.blue,
        ),
        Text(label),
      ],
    );
  }
}
