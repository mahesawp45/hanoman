// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hanoman/core/widgets/appbar/main_app_bar.dart';
import 'package:hanoman/presentation/main/dine_in/views/dine_in_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hanoman/core/constants/icons.dart';
import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/buttons/menu_button.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double paddingTop = MediaQuery.of(context).padding.top;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          height * (height < 400 ? 0.3 : 0.2),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: paddingTop),
          child: MainAppBar(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuButton(
                  isTapped: true,
                  icon: AppIcons.dineIn,
                  label: AppStrings.dineIn,
                  onTap: () {},
                ),
                MenuButton(
                  isTapped: false,
                  icon: AppIcons.takeAway,
                  label: AppStrings.takeAway,
                  onTap: () {},
                ),
                MenuButton(
                  isTapped: false,
                  icon: AppIcons.delivery,
                  label: AppStrings.delivery,
                  onTap: () {},
                ),
                MenuButton(
                  isTapped: false,
                  icon: AppIcons.reservation,
                  label: AppStrings.reservation,
                  onTap: () {},
                ),
                MenuButton(
                  isTapped: false,
                  icon: AppIcons.settings,
                  label: AppStrings.settings,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        children: const [
          DineInScreen(),
        ],
      ),
    );
  }
}
