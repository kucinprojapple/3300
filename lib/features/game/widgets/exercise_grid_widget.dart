import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseGridWidget extends StatelessWidget {
  final ValueChanged<int> onLevelSelected;

  ExerciseGridWidget({super.key, required this.onLevelSelected});

  final List<int> openedLevels = [1, 2, 3, 4, 5, 6];
  final List<int> lockedLevels = [7, 8, 9];

  @override
  Widget build(BuildContext context) {
    const crossAxisCount = 3;
    final horizontalPadding = 4.w;
    final crossAxisSpacing = 12.w;
    final mainAxisSpacing = 60.h;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - horizontalPadding * 2;
        final totalSpacing = (crossAxisCount - 1) * crossAxisSpacing;
        final itemWidth = (availableWidth - totalSpacing) / crossAxisCount;

        final imageSize = itemWidth * 1;
        final fontSize = (imageSize * 0.28).clamp(18.0, 48.0);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            childAspectRatio: 1,
            children: List.generate(9, (index) {
              final level = index + 1;
              final isOpened = openedLevels.contains(level);

              return Center(child: Text('Grid'));
            }),
          ),
        );
      },
    );
  }
}
