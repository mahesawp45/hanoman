// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hanoman/core/constants/colors.dart';
import 'package:hanoman/core/constants/icons.dart';
import 'package:hanoman/core/constants/strings.dart';
import 'package:hanoman/core/widgets/buttons/button.dart';
import 'package:hanoman/core/widgets/buttons/svg_button.dart';
import 'package:hanoman/core/widgets/card/dine_in_card.dart';
import 'package:hanoman/core/widgets/dialog/content_dialog_guest.dart';
import 'package:hanoman/core/widgets/dialog/modal_dialog.dart';
import 'package:hanoman/core/widgets/input/input.dart';
import 'package:hanoman/core/widgets/input/select_input.dart';
import 'package:hanoman/core/widgets/table/table_data.dart';
import 'package:hanoman/presentation/main/order/views/order_screen.dart';

class DineInScreen extends HookConsumerWidget {
  const DineInScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final PageController pageController = usePageController();
    final TabController tabController = useTabController(initialLength: 2);
    final orderId = useState<String>("");
    final isTappedTable = useState<bool>(true);
    final isTappedList = useState<bool>(false);

    List<String> rooms = ["All Rooms", "Lantai 1", "Lantai 2", "Lantai 3"];
    List<DropdownMenuItem<String>>? getAllRooms(
        {required List<String> rooms, double? width}) {
      return List.generate(
        (rooms).length,
        (index) => DropdownMenuItem<String>(
          value: rooms[index],
          child: SizedBox(
            width: width,
            child: Text(
              rooms[index],
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
    }

    List<String> tables = ["1", "2", "3"];
    List<DropdownMenuItem<String>>? getAllTables(
        {required List<String> tables, double? width}) {
      return List.generate(
        (tables).length,
        (index) => DropdownMenuItem<String>(
          value: tables[index],
          child: SizedBox(
            width: width,
            child: Text(
              tables[index],
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      );
    }

    void showAddNewGuestDialog() {
      ModalDialog(
        content: ContentDialogGuest(
          title: AppStrings.addNewGuest,
          subTitle: AppStrings.captainOrder,
          onYes: () {},
          initialRoom: rooms[0],
          rooms: getAllRooms(
                rooms: rooms,
                width: width * 0.25,
              ) ??
              [],
          initialTable: tables[0],
          tables: getAllTables(
                tables: tables,
                width: width * 0.25,
              ) ??
              [],
        ),
      ).showAnimatedDialog(context);
    }

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgButton(
                        icon: AppIcons.notif,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectInput(
                        initialItem: rooms[0],
                        items: getAllRooms(
                                rooms: rooms,
                                width: width *
                                    (isTappedList.value ? 0.25 : 0.5)) ??
                            [],
                      ),
                      Visibility(
                        visible: isTappedList.value,
                        child: SelectInput(
                          initialItem: tables[0],
                          items: getAllTables(
                                  tables: tables, width: width * 0.25) ??
                              [],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgButton(
                              icon: AppIcons.table,
                              isTapped: isTappedTable.value,
                              onTap: () {
                                isTappedTable.value = true;
                                isTappedList.value = false;
                                tabController.animateTo(0);
                              },
                            ),
                            const SizedBox(width: 10),
                            SvgButton(
                              icon: AppIcons.list,
                              isTapped: isTappedList.value,
                              onTap: () {
                                isTappedList.value = true;
                                isTappedTable.value = false;
                                tabController.animateTo(1);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
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
                        label: AppStrings.newGuest,
                        icon: Icons.add,
                        onTap: () {
                          showAddNewGuestDialog();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    height: width,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        TableViewGuest(
                          pageController: pageController,
                          toDetail: (id) {
                            orderId.value = id;
                          },
                        ),
                        ListViewGuest(
                          pageController: pageController,
                          toDetail: (id) {
                            orderId.value = id;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Order Screen
          OrderScreen(
            orderId: orderId.value,
            pageController: pageController,
          ),
        ],
      ),
    );
  }
}

class TableViewGuest extends StatelessWidget {
  const TableViewGuest({
    Key? key,
    required this.pageController,
    required this.toDetail,
  }) : super(key: key);

  final PageController pageController;
  final Function(String) toDetail;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 5 / 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return DineInCard(
          id: index.toString(),
          status: "AVAILABLE",
          onTapDetail: () {
            pageController.animateToPage(
              1,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOutExpo,
            );
            toDetail(index.toString());
          },
        );
      },
    );
  }
}

class ListViewGuest extends StatelessWidget {
  const ListViewGuest({
    Key? key,
    required this.pageController,
    required this.toDetail,
  }) : super(key: key);
  final PageController pageController;
  final Function(String) toDetail;

  @override
  Widget build(BuildContext context) {
    List<String> columns = [
      "No.",
      "Guest Name",
      "Status",
      "Room",
      "Table",
      "Person",
      "Action"
    ];
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

    List<Map<String, dynamic>> allData = List.generate(
      10,
      (index) => {
        "no": index + 1,
        "name": "User $index",
        "status": "Available ($index)",
        "room": index + 1,
        "table": index + 1,
        "total_person": index,
        "capacity": 6,
      },
    );

    List<DataRow> rowsTable = List.generate(
      allData.length,
      (index) => DataRow(
        cells: [
          Cells(
            data: Text(
              allData[index]["no"].toString(),
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Text(
              allData[index]["name"],
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Text(
              allData[index]["status"],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.green,
              ),
            ),
          ).create(),
          Cells(
            data: Text(
              allData[index]["room"].toString(),
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Text(
              allData[index]["table"].toString(),
              textAlign: TextAlign.center,
            ),
          ).create(),
          Cells(
            data: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${allData[index]['total_person']} ",
                  textAlign: TextAlign.center,
                ),
                Text(
                  " (${allData[index]['capacity']})",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.orange,
                  ),
                ),
              ],
            ),
          ).create(),
          Cells(
            data: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgButton(
                  isFilled: true,
                  icon: AppIcons.order,
                  onTap: () {
                    pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOutExpo,
                    );
                    toDetail(index.toString());
                  },
                ),
                SvgButton(
                  isFilled: true,
                  icon: AppIcons.edit,
                  onTap: () {},
                ),
                SvgButton(
                  isFilled: true,
                  icon: AppIcons.bill,
                  onTap: () {},
                ),
              ],
            ),
          ).create(),
        ],
      ),
    );

    return TableData(columnsTable: columnsTable, rowsTable: rowsTable);
  }
}
