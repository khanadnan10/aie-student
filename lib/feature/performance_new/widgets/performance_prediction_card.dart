import 'package:flutter/material.dart';
import 'package:student_ui/utils/colors.dart';
import 'package:student_ui/utils/fonts.dart';

class PerformancePredictorCard extends StatefulWidget {
  PerformancePredictorCard({
    Key? key,
    required this.title,
    required this.measure,
    required this.value,
    required this.screenSize,
  }) : super(key: key);

  final String title;
  final String measure;
  double value;
  final Size screenSize;

  @override
  State<PerformancePredictorCard> createState() =>
      _PerformancePredictorCardState();
}

class _PerformancePredictorCardState extends State<PerformancePredictorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title, // match it with the map keys
                style: AppFont.kBodyTextStyle.copyWith(
                  color: AppColor.kGrey,
                ),
              ),
              SizedBox(
                width: widget.screenSize.width * 0.6,
                child: SliderTheme(
                  data: SliderThemeData(
                    inactiveTrackColor: Colors.red[100],
                    trackShape: const RoundedRectSliderTrackShape(),
                    trackHeight: 1.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6.0,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 2.0,
                    ),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    valueIndicatorShape:
                        const RectangularSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.transparent,
                    valueIndicatorTextStyle: AppFont.kSmallTextStyle.copyWith(
                      color: AppColor.kGrey,
                    ),
                  ),
                  child: Slider(
                    inactiveColor: AppColor.kPurple.withOpacity(0.5),
                    activeColor: AppColor.kPurple.withOpacity(0.5),
                    thumbColor: AppColor.kPurple,
                    value: widget.value,
                    max: 100,
                    min: 0,
                    divisions: 10,
                    label: '${(widget.value).toInt()} ${widget.measure}',
                    onChanged: (value) {
                      setState(() {
                        widget.value = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
