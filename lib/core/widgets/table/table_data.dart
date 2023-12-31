// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:hanoman/core/constants/colors.dart';

class TableData extends HookConsumerWidget {
  const TableData({
    super.key,
    required this.columnsTable,
    required this.rowsTable,
    this.isPaginate,
  });

  final List<DataColumn> columnsTable;
  final List<DataRow> rowsTable;
  final bool? isPaginate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final sizesTapped = useState<int>(0);

    List<int> sizes = [10, 25, 50, 100];
    List<Widget> sizeButtons = List.generate(
      sizes.length,
      (index) {
        return PaginateButton(
          isTapped: sizesTapped.value == index,
          label: sizes[index].toString(),
          onTap: () {
            sizesTapped.value = index;
          },
        );
      },
    );

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
          space: 0,
          thickness: 0,
          indent: 0,
          endIndent: 0,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: width,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (states) => AppColors.blue.withOpacity(0.1),
              ),
              dividerThickness: 0,
              columns: columnsTable,
              rows: rowsTable,
            ),
          ),
          Visibility(
            visible: isPaginate == true,
            child: Column(
              children: [
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Text("List"),
                          const Icon(Icons.chevron_right_rounded),
                          Row(
                            children: sizeButtons,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.keyboard_double_arrow_left_rounded,
                              color: AppColors.gray.withOpacity(0.5),
                            ),
                          ),
                          PaginateNavigationButton(
                            direction: Direction.left,
                            label: "Back",
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          PaginateButton(
                            isTapped: true,
                            label: "1",
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          PaginateNavigationButton(
                            direction: Direction.right,
                            label: "Next",
                            onTap: () {},
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.keyboard_double_arrow_right_rounded,
                              color: AppColors.gray.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum Direction { left, right }

class PaginateNavigationButton extends StatelessWidget {
  const PaginateNavigationButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.direction,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final Direction direction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Visibility(
            visible: direction == Direction.left,
            child: Icon(
              Icons.chevron_left_rounded,
              color: AppColors.gray.withOpacity(0.5),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: AppColors.gray.withOpacity(0.5),
            ),
          ),
          Visibility(
            visible: direction == Direction.right,
            child: Icon(
              Icons.chevron_right_rounded,
              color: AppColors.gray.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class PaginateButton extends StatelessWidget {
  const PaginateButton({
    Key? key,
    required this.label,
    required this.isTapped,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final bool isTapped;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isTapped ? AppColors.blue : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: isTapped ? AppColors.white : null),
          ),
        ),
      ),
    );
  }
}

class Cells {
  final Widget data;
  Cells({
    required this.data,
  });

  DataCell create() {
    return DataCell(
      Align(
        alignment: Alignment.center,
        child: data,
      ),
    );
  }
}
