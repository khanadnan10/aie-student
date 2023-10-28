// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';

class PerformanceFilterChip extends StatefulWidget {
  PerformanceFilterChip({
    Key? key,
    required this.item,
  }) : super(key: key);

  late List<String> item;

  @override
  State<PerformanceFilterChip> createState() => _PerformanceFilterChipState();
}

class _PerformanceFilterChipState extends State<PerformanceFilterChip> {
  // Performance in types question filter chip ---
  late List<String> selectedItem = [widget.item.first];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.item.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: FilterChip(
              label: Text(widget.item[index]),
              onSelected: (val) {
                if (selectedItem.contains(widget.item[index])) {
                  selectedItem.remove(widget.item[index]);
                } else {
                  selectedItem.add(widget.item[index]);
                }
                setState(() {});
              },
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              side: const BorderSide(color: AppColor.kPurple),
              showCheckmark: false,
              labelStyle: TextStyle(
                color: selectedItem.contains(widget.item[index])
                    ? AppColor.kWhite
                    : AppColor.kPurple,
              ),
              selected: selectedItem.contains(widget.item[index]),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              selectedColor: selectedItem.contains(widget.item[index])
                  ? AppColor.kPurple
                  : AppColor.kWhite,
            ),
          );
        });
  }
}
