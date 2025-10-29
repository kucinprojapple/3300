import '../../../app_core_design/assets.dart';
import '../model/exercise_entity.dart';

final List<ExerciseEntity> exercisesData = [
  const ExerciseEntity(
    name: 'Push-Ups',
    target: 'Chest, Triceps, Shoulders, Core',
    technique:
        'Keep your body straight, hands slightly wider than shoulder-width apart. Lower yourself until your chest is parallel to the floor, then push yourself up.',
    tip: "Don’t let your pelvis drop -  your core should be rigid.",
    image: AppAssets.exercisePushUps,
  ),
  const ExerciseEntity(
    name: 'Tricep Dips',
    target: 'Triceps, shoulders',
    technique:
        'Hands behind your back on a bench or chair, legs in front of you. Bend your elbows as you lower your body, then lift.',
    tip: "Keep your elbows close to your body.",
    image: AppAssets.exerciseTricepDips,
  ),
  const ExerciseEntity(
    name: 'Squats',
    target: 'Legs, Buttocks, Core',
    technique:
        'Standing straight, feet shoulder-width apart. Squat down, tilting your pelvis back as if you were sitting down. Your knees should not go beyond your toes.',
    tip: "Keep your heels on the floor at all times.",
    image: AppAssets.exerciseSquats,
  ),
  const ExerciseEntity(
    name: 'Lunges',
    target: 'Quads, Glutes, Balance',
    technique:
        'Step forward and lower until both knees are bent at 90°. Return to starting position.',
    tip: "Keep your back straight, don’t lean forward.",
    image: AppAssets.exerciseLunges,
  ),
  const ExerciseEntity(
    name: 'Burpees',
    target: 'Total body, Cardio',
    technique:
        'Squat, step back into plank, do push-ups, turn around, jump up. Repeat.',
    tip: "Move at a pace, but don’t sacrifice technique.",
    image: AppAssets.exerciseBurpees,
  ),
  const ExerciseEntity(
    name: 'Jumping Jacks',
    target: 'Cardio, Shoulders, legs',
    technique:
        'Jump, spreading your arms and legs out to the sides, then return to the starting position.',
    tip: "Light on your feet, watch your breathing rhythm.",
    image: AppAssets.exerciseJumpingJacks,
  ),
  const ExerciseEntity(
    name: 'Crunches',
    target: 'Upper abs',
    technique:
        "Lie on your back, knees bent. Lift your shoulder blades without pulling on your neck, then roll back.",
    tip: "Exhale as you lift, don’t use your hands.",
    image: AppAssets.exerciseCrunches,
  ),
  const ExerciseEntity(
    name: 'Bicycle Crunches',
    target: 'Obliques and rectus abdominis',
    technique:
        "Lying on your back, alternately curling your elbow towards the opposite knee, simulating pedaling.",
    tip: "Keep the movement smooth, don’t strain your neck.",
    image: AppAssets.exerciseBicycleCrunches,
  ),
  const ExerciseEntity(
    name: 'Leg Raises',
    target: 'Obliques and rectus abdominis',
    technique:
        "Lying on your back, raise your straight legs up without arching your back. Lower slowly.",
    tip: "Tighten your abs - don’t let your lower back arch.",
    image: AppAssets.exerciseLegRaises,
  ),
];
