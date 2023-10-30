// ignore_for_file: dead_code

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/utils/colors.dart';

class ActivityTimeFilterChip extends StatefulWidget {
  ActivityTimeFilterChip({
    Key? key,
    required this.item,
    required this.selectedItem,
  }) : super(key: key);

  List<String> item;
  List<String> selectedItem;

  @override
  State<ActivityTimeFilterChip> createState() => _ActivityTimeFilterChipState();
}

class _ActivityTimeFilterChipState extends State<ActivityTimeFilterChip> {
  // Performance in types question filter chip ---
  late List<String> selectedItem = [widget.selectedItem.first];

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
              label: Text(
                widget.item[index],
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              onSelected: (val) {
                if (selectedItem.isEmpty) {
                  selectedItem.add(widget.item[0]);
                }
                if (selectedItem.contains(widget.item[index])) {
                  selectedItem.remove(widget.item[index]);
                } else {
                  selectedItem.add(widget.item[index]);
                }

                setState(() {});
              },
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              side: BorderSide(
                color: !selectedItem.contains(widget.item[index])
                    ? AppColor.kWhite
                    : Colors.transparent,
              ),
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
                  : AppColor.kGrey,
            ),
          );
        });
  }
}
