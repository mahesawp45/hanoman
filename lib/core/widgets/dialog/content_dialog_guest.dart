// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/dialog/content_dialog.dart';
import 'package:hanoman/core/widgets/input/input.dart';
import 'package:hanoman/core/widgets/input/select_input.dart';

class ContentDialogGuest extends StatelessWidget {
  const ContentDialogGuest({
    Key? key,
    required this.rooms,
    required this.initialRoom,
    required this.tables,
    required this.initialTable,
    required this.title,
    required this.subTitle,
    required this.onYes,
  }) : super(key: key);

  final List<DropdownMenuItem<String>> rooms;
  final String initialRoom;

  final List<DropdownMenuItem<String>> tables;
  final String initialTable;

  final String title;
  final String subTitle;
  final VoidCallback onYes;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ContentDialog(
      onYes: onYes,
      title: title,
      subTitle: subTitle,
      child: Column(
        children: [
          Input(
            width: width,
            controller: TextEditingController(),
            label: AppStrings.guestName,
            hintText: AppStrings.inputGuestName,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectInput(
                label: AppStrings.room,
                initialItem: initialRoom,
                items: rooms,
              ),
              SelectInput(
                label: AppStrings.tables,
                initialItem: initialTable,
                items: tables,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Input(
            width: width,
            controller: TextEditingController(),
            type: TextInputType.number,
            label: AppStrings.person,
            hintText: AppStrings.inputPerson,
            info: AppStrings.capacityTableInfo,
          ),
        ],
      ),
    );
  }
}
