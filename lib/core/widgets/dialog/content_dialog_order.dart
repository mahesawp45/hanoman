// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/font_size.dart';

import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/dialog/content_dialog.dart';
import 'package:hanoman/core/widgets/input/input.dart';
import 'package:hanoman/core/widgets/input/input_read_dotted.dart';

class ContentDialogOrder extends StatelessWidget {
  const ContentDialogOrder({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onYes,
    required this.additionals,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final VoidCallback onYes;
  final List<Widget> additionals;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ContentDialog(
      onYes: onYes,
      title: title,
      subTitle: subTitle,
      labelYes: AppStrings.order,
      child: Column(
        children: [
          InputReadDotted(
            width: width,
            data: "NASI GORENG",
            label: AppStrings.name,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputReadDotted(
                width: width * 0.35,
                data: "Food",
                label: AppStrings.category,
              ),
              Input(
                width: width * 0.35,
                controller: TextEditingController(),
                type: TextInputType.number,
                label: AppStrings.quantity,
                hintText: AppStrings.quantityHint,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.additional,
                style: TextStyle(
                  fontSize: AppFontSizes.bodySmall,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: additionals,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Input(
            width: width,
            minLines: 5,
            controller: TextEditingController(),
            label: AppStrings.note,
            hintText: AppStrings.noteHint,
          ),
        ],
      ),
    );
  }
}
