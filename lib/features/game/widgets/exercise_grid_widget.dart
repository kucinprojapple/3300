import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../exercises/data/exercise_list.dart';

class ExerciseGridWidget extends StatefulWidget {
  final ValueChanged<int> onExerciseSelected;

  const ExerciseGridWidget({super.key, required this.onExerciseSelected});

  @override
  State<ExerciseGridWidget> createState() => _ExerciseGridWidgetState();
}

class _ExerciseGridWidgetState extends State<ExerciseGridWidget> {
  late List<_ExerciseCardData> _shuffledExercises;
  final Map<int, FlipCardController> _controllers = {};
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();

    final List<_ExerciseCardData> exercises = [
      _ExerciseCardData(AppAssets.exercisePushUps, exercisesData[0]),
      _ExerciseCardData(AppAssets.exerciseTricepDips, exercisesData[1]),
      _ExerciseCardData(AppAssets.exerciseSquats, exercisesData[2]),
      _ExerciseCardData(AppAssets.exerciseLunges, exercisesData[3]),
      _ExerciseCardData(AppAssets.exerciseBurpees, exercisesData[4]),
      _ExerciseCardData(AppAssets.exerciseJumpingJacks, exercisesData[5]),
      _ExerciseCardData(AppAssets.exerciseCrunches, exercisesData[6]),
      _ExerciseCardData(AppAssets.exerciseBicycleCrunches, exercisesData[7]),
      _ExerciseCardData(AppAssets.exerciseLegRaises, exercisesData[8]),
    ];

    _shuffledExercises = List.of(exercises)..shuffle(Random());

    for (int i = 0; i < _shuffledExercises.length; i++) {
      _controllers[i] = FlipCardController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _shuffledExercises.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 32.w,
          mainAxisSpacing: 4.h,
          childAspectRatio: 0.88,
        ),
        itemBuilder: (context, index) {
          final item = _shuffledExercises[index];

          return GestureDetector(
            onTap: () async {
              if (_isLocked) return;
              setState(() => _isLocked = true);

              _controllers[index]!.flipcard();
              await Future.delayed(const Duration(milliseconds: 300));

              final originalIndex = exercisesData.indexOf(item.exercise);
              widget.onExerciseSelected(originalIndex);
            },
            child: FlipCard(
              key: ValueKey('exercise_card_$index'),
              controller: _controllers[index]!,
              axis: FlipAxis.horizontal,
              rotateSide: RotateSide.right,
              animationDuration: const Duration(milliseconds: 400),
              onTapFlipping: false,
              frontWidget: _buildCard(),
              backWidget: _buildCard(imagePath: item.imagePath),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({String? imagePath}) {
    return CustomGradientContainerWidget(
      width: 90.w,
      height: 90.h,
      borderRadius: 12.r,
      borderWidth: 2.r,
      backgroundGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF1D5401), Color(0xFF020500)],
        stops: [0.5, 1.0],
      ),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
      ),
      child:
          imagePath != null
              ? Padding(
                padding: EdgeInsets.all(8.w),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              )
              : null,
    );
  }
}

class _ExerciseCardData {
  final String imagePath;
  final dynamic exercise;

  _ExerciseCardData(this.imagePath, this.exercise);
}


