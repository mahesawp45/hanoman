// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/font_size.dart';
import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/buttons/button.dart';

class ContentDialog extends StatelessWidget {
  const ContentDialog({
    Key? key,
    required this.onYes,
    required this.child,
    required this.title,
    required this.subTitle,
    this.labelYes,
  }) : super(key: key);

  final VoidCallback onYes;
  final Widget child;
  final String title;
  final String subTitle;
  final String? labelYes;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: SizedBox(
        width: width * 0.8,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(width * 0.1),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: AppFontSizes.bodyLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subTitle,
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  child,
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        isOutlined: true,
                        label: AppStrings.cancel,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 10),
                      Button(
                        label: labelYes ?? AppStrings.next,
                        onTap: onYes,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
