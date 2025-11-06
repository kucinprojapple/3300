import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_core_design/text_styles.dart';
import '../../../../app_core_design/texts.dart';
import '../../../../core/constants/timer_constants.dart';
import 'timer_option_circle_widget.dart';

class SettingsTimerSelector extends StatelessWidget {
  final int selectedTimer;
  final ValueChanged<int> onSelect;

  const SettingsTimerSelector({
    super.key,
    required this.selectedTimer,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: MainTextBody.gradientText(
              context,
              AppTexts.timer,
              fontSize: 25.sp,
              alignment: Alignment.centerLeft,
              useShadow: false,
              height: 1.1,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children:
                TimerConstants.timerOptions.map((seconds) {
                  return Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: TimerOptionCircleWidget(
                      seconds: seconds,
                      isSelected: selectedTimer == seconds,
                      onTap: () => onSelect(seconds),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
