// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hanoman/core/widgets/dialog/content_dialog_order.dart';
import 'package:hanoman/core/widgets/dialog/content_dialog_special_request.dart';
import 'package:hanoman/core/widgets/dialog/modal_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/font_size.dart';
import 'package:hanoman/core/constants/icons.dart';
import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/buttons/button.dart';
import 'package:hanoman/core/widgets/buttons/svg_button.dart';
import 'package:hanoman/core/widgets/input/input.dart';
import 'package:hanoman/core/widgets/input/input_check.dart';
import 'package:hanoman/core/widgets/input/input_read_dotted.dart';
import 'package:hanoman/core/widgets/table/table_data.dart';
import 'package:hanoman/data/models/order/order.dart';
import 'package:hanoman/presentation/main/order/controllers/order_controller.dart';

class OrderScreen extends HookConsumerWidget {
  const OrderScreen({
    super.key,
    required this.orderId,
    this.pageController,
  });
  final String orderId;
  final PageController? pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final orderFuture = ref
        .watch(orderControllerProvider.notifier)
        .orderDetail(orderId: orderId);

    List<String> categories = ["1", "2", "3"];
    List<DropdownMenuItem<String>>? getAllCategories(
        {required List<String> categories, double? width}) {
      return List.generate(
        (categories).length,
        (index) => DropdownMenuItem<String>(
          value: categories[index],
          child: SizedBox(
            width: width,
            child: Text(
              categories[index],
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
    }

    List<Map<String, dynamic>> foodCategories = [
      {
        "id": 1,
        "name": "All",
        "isSelected": false,
      },
      {
        "id": 2,
        "name": "Food",
        "isSelected": true,
      },
      {
        "id": 3,
        "name": "Baverage",
        "isSelected": true,
      },
      {
        "id": 4,
        "name": "Desert",
        "isSelected": false,
      },
    ];

    List<Widget> getAllFoodCategories() {
      return List.generate(
        foodCategories.length,
        (index) => InputCheck(
          label: foodCategories[index]["name"],
          value: foodCategories[index]["isSelected"],
          onChange: (value) {},
        ),
      );
    }

    void showAddSpecialRequestDialog() {
      ModalDialog(
        content: ContentDialogSpecialRequest(
          title: AppStrings.specialReq,
          subTitle: AppStrings.captainOrder,
          initialCategory: categories[0],
          categories: getAllCategories(
                categories: categories,
                width: width,
              ) ??
              [],
          onYes: () {},
        ),
      ).showAnimatedDialog(context);
    }

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        pageController?.animateToPage(0,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOutExpo);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            child: FutureBuilder(
              future: orderFuture,
              builder: (context, snapshot) {
                final state = snapshot.data;

                if (state?.isLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state?.error != null) {
                  return Center(
                    child: Text(state?.error ?? ""),
                  );
                } else {
                  final orderDetail = state?.data as OrderDetail?;

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              pageController?.animateToPage(0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeInOutExpo);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: AppColors.gray.withOpacity(0.5),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  AppStrings.order,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppFontSizes.titleLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgButton(
                            icon: AppIcons.notif,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      InputReadDotted(
                        width: width,
                        data: orderDetail?.guestName ?? "",
                        label: AppStrings.guestName,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InputReadDotted(
                            width: width * 0.4,
                            data: orderDetail?.room ?? "",
                            label: AppStrings.room,
                          ),
                          InputReadDotted(
                            width: width * 0.4,
                            data: orderDetail?.table ?? "",
                            label: AppStrings.tables,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: getAllFoodCategories(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Input(
                            prefixIcon: Icons.search,
                            hintText: AppStrings.cari,
                            controller: TextEditingController(),
                            width: width * (height < 400 ? 0.7 : 0.75),
                          ),
                          Button(
                            label: AppStrings.specialReq,
                            icon: Icons.add,
                            onTap: () {
                              showAddSpecialRequestDialog();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      OrderTable(items: orderDetail?.items ?? []),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Button(
                            isOutlined: true,
                            label: AppStrings.cancel,
                            onTap: () {
                              pageController?.animateToPage(0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeInOutExpo);
                            },
                          ),
                          const SizedBox(width: 10),
                          Button(
                            label: AppStrings.save,
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class OrderTable extends StatelessWidget {
  const OrderTable({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<OrderItem> items;

  @override
  Widget build(BuildContext context) {
    List<String> columns = ["No.", "Nama", "Kategori", "Harga", "Action"];
    List<DataColumn> columnsTable = List.generate(
      columns.length,
      (index) => DataColumn(
        label: Expanded(
          child: Text(
            columns[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );

    List<Map<String, dynamic>> additonal = [
      {
        "id": 1,
        "name": "Telur",
        "isSelected": false,
      },
      {
        "id": 2,
        "name": "Sosis",
        "isSelected": true,
      },
      {
        "id": 3,
        "name": "Extra Pedas",
        "isSelected": true,
      },
      {
        "id": 4,
        "name": "Pete",
        "isSelected": false,
      },
    ];

    List<Widget> getAllAdditional() {
      return List.generate(
        additonal.length,
        (index) => InputCheck(
          label: additonal[index]["name"],
          value: additonal[index]["isSelected"],
          onChange: (value) {},
        ),
      );
    }

    void showAddOrderDialog() {
      ModalDialog(
        content: ContentDialogOrder(
          title: AppStrings.order,
          subTitle: AppStrings.captainOrder,
          additionals: getAllAdditional(),
          onYes: () {},
        ),
      ).showAnimatedDialog(context);
    }

    List<DataRow> rowsTable = List.generate(
      items.length,
      (index) {
        final data = items[index];

        return DataRow(cells: [
          Cells(
            data: Text(
              data.id,
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Text(
              data.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.blue,
              ),
            ),
          ).create(),
          Cells(
            data: Text(
              data.category,
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Text(
              data.price.toString(),
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgButton(
                  isFilled: true,
                  icon: AppIcons.add,
                  onTap: () {
                    showAddOrderDialog();
                  },
                ),
                SvgButton(
                  isFilled: true,
                  icon: AppIcons.edit,
                  onTap: () {},
                ),
              ],
            ),
          ).create(),
        ]);
      },
    );

    return TableData(
      columnsTable: columnsTable,
      rowsTable: rowsTable,
      isPaginate: true,
    );
  }
}
