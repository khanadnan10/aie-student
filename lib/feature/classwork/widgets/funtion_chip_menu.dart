// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';


class FunctionChip extends StatefulWidget {
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;
  final Icon? icon;

  const FunctionChip({
    Key? key,
    this.value,
    required this.items,
    required this.onChanged,
    required this.hintText,
    this.icon,
  }) : super(key: key);

  @override
  _FunctionChipState createState() => _FunctionChipState();
}

class _FunctionChipState extends State<FunctionChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.kGrey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DropdownButton<String>(
            underline: const SizedBox(),
            hint: Text(
              widget.hintText,
              style: const TextStyle(
                color: AppColor.kGrey,
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            icon: widget.icon,
            value: widget.value,
            items: widget.items.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
