// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/font_size.dart';
import 'package:hanoman/core/constants/icons.dart';
import 'package:hanoman/core/widgets/buttons/button.dart';

class DineInCard extends StatelessWidget {
  const DineInCard({
    Key? key,
    required this.id,
    required this.status,
    required this.onTapDetail,
  }) : super(key: key);

  final String id;
  final String status;
  final VoidCallback onTapDetail;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.1),
        border: Border.all(
          color: AppColors.black.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const NumberGuest(number: 1),
              Text(status),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppIcons.reset),
              ),
            ],
          ),
          Expanded(
            child: SvgPicture.asset(
              AppIcons.person,
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "PERSON: ${5}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSizes.bodySmall,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "MAX: ${6}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSizes.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height < 400 ? 20 : 60),
            child: Button(
              label: "Lihat Bill",
              icon: Icons.arrow_forward,
              onTap: onTapDetail,
            ),
          )
        ],
      ),
    );
  }
}

class NumberGuest extends StatelessWidget {
  const NumberGuest({
    Key? key,
    required this.number,
  }) : super(key: key);

  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
