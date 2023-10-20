// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:student_ui/feature/commulative/widgets/verticle_dot_line.dart';
import 'package:student_ui/utils/colors.dart';

class BestPerformanceBarChart extends StatefulWidget {
  final Gradient gradient;
  final double percent;
  final String text;
  final bool isVisible;

  const BestPerformanceBarChart({
    Key? key,
    required this.gradient,
    required this.percent,
    required this.text,
    required this.isVisible,
  }) : super(key: key);

  @override
  State<BestPerformanceBarChart> createState() =>
      _BestPerformanceBarChartState();
}

class _BestPerformanceBarChartState extends State<BestPerformanceBarChart> {
  late bool isContainerVisible = widget.isVisible;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  // bar
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isContainerVisible = !isContainerVisible;
                      });
                    },
                    child: Container(
                      height: widget.percent + 30,
                      width: MediaQuery.of(context).size.width * 0.07,
                      decoration: BoxDecoration(
                          gradient: widget.gradient,
                          borderRadius: BorderRadius.circular(6.0)),
                      child: isContainerVisible == true
                          ? Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: -50,
                                  child: Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: AppColor.kGreen,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Text(
                                      '${widget.percent.toInt()}%',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: AppColor.kWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: VerticalDottedLine(
                      height: widget.percent + 100,
                    ),
                  ),
                ],
              ),
              //text
              Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
