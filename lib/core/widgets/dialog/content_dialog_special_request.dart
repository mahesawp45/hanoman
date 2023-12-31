// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/dialog/content_dialog.dart';
import 'package:hanoman/core/widgets/input/input.dart';
import 'package:hanoman/core/widgets/input/select_input.dart';

class ContentDialogSpecialRequest extends StatelessWidget {
  const ContentDialogSpecialRequest({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.onYes,
    required this.categories,
    required this.initialCategory,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final VoidCallback onYes;
  final List<DropdownMenuItem<String>> categories;
  final String initialCategory;

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
          Input(
            width: width,
            controller: TextEditingController(),
            label: AppStrings.specialReq,
            hintText: AppStrings.specialReqHint,
          ),
          const SizedBox(height: 20),
          SelectInput(
            label: AppStrings.category,
            initialItem: initialCategory,
            items: categories,
          ),
          const SizedBox(height: 20),
          Input(
            width: width,
            controller: TextEditingController(),
            type: TextInputType.number,
            label: AppStrings.quantity,
            hintText: AppStrings.quantityHint,
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
