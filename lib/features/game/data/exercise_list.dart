import '../../../app_core._design/assets.dart';
import '../model/exercise_entity.dart';

final List<ExerciseEntity> exercisesData = [

  const ExerciseEntity(
    name: 'Push-Ups',
    target: 'Chest, Triceps, Shoulders, Core',
    technique:
    'Keep your body straight, hands slightly wider than shoulder-width apart. Lower yourself until your chest is parallel to the floor, then push yourself up.',
    tip: 'Don’t let your pelvis drop — keep your core rigid.',
    image: AppAssets.exercisePushUps,
  ),
  const ExerciseEntity(
    name: 'Tricep Dips',
    target: 'Triceps, Shoulders',
    technique:
    'Place your hands behind your back on a bench or chair, legs extended in front of you. Bend your elbows to lower your body, then push back up to the starting position.',
    tip: 'Keep your elbows close to your body throughout the movement.',
    image: AppAssets.exerciseTricepDips,
  ),
  const ExerciseEntity(
    name: 'Squats',
    target: 'Legs, Buttocks, Core',
    technique:
    'Stand straight with your feet shoulder-width apart. Lower yourself down, tilting your pelvis back as if sitting down. Keep your chest up and make sure your knees don’t go beyond your toes.',
    tip: 'Keep your heels firmly on the floor at all times.',
    image: AppAssets.exerciseSquats,
  ),
  const ExerciseEntity(
    name: 'Lunges',
    target: 'Quads, Glutes, Balance',
    technique:
    'Step forward with one leg and lower your body until both knees are bent at about 90°. Push off your front foot to return to the starting position.',
    tip: 'Keep your back straight and avoid leaning forward.',
    image: AppAssets.exerciseLunges,
  ),
  ExerciseEntity(
    name: 'Burpees',
    image: AppAssets.exerciseBurpees,
    target: 'Total body, Cardio',
    technique:
    'Squat, step back into plank, do push-ups, turn around, jump up. Repeat.',
    tip: "Move at a pace, but don't sacrifice technique.",
  ),
  ExerciseEntity(
    name: 'Jumping Jacks',
    image: AppAssets.exerciseJumpingJacks,
    target: 'Cardio, Shoulders, Legs',
    technique:
    'Jump, spreading your arms and legs out to the sides, then return to the starting position.',
    tip: 'Be light on your feet and keep a steady breathing rhythm.',
  ),
  ExerciseEntity(
    name: 'Crunches',
    image: AppAssets.exerciseCrunches,
    target: 'Upper Abs',
    technique:
    'Lie on your back with your knees bent. Lift your shoulder blades without pulling on your neck, then roll back down.',
    tip: "Exhale as you lift and avoid using your hands to pull your head.",
  ),
  ExerciseEntity(
    name: 'Bicycle Crunches',
    image: AppAssets.exerciseBicycleCrunches,
    target: 'Obliques and Rectus Abdominis',
    technique:
    'Lie on your back and alternately curl your elbow towards the opposite knee, simulating a pedaling motion.',
    tip: "Keep the movement smooth and avoid straining your neck.",
  ),
  ExerciseEntity(
    name: 'Leg Raises',
    image: AppAssets.exerciseLegRaises,
    target: 'Obliques and Rectus Abdominis',
    technique:
    'Lie on your back and raise your straight legs up without arching your back. Lower them slowly back down.',
    tip: "Tighten your abs and don’t let your lower back arch off the floor.",
  ),

  // 🔜 добавляй остальные упражнения здесь
];