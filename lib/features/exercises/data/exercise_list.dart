import '../../../app_core_design/assets.dart';
import '../../../app_core_design/texts.dart';
import '../model/exercise_entity.dart';

final List<ExerciseEntity> exercisesData = [
  const ExerciseEntity(
    name: AppTexts.pushUps,
    target: AppTexts.pushUpsTarget,
    technique: AppTexts.pushUpsTechnique,
    tip: AppTexts.pushUpsTip,
    image: AppAssets.exercisePushUps,
  ),
  const ExerciseEntity(
    name: AppTexts.tricepDips,
    target: AppTexts.tricepDipsTarget,
    technique: AppTexts.tricepDipsTechnique,
    tip: AppTexts.tricepDipsTip,
    image: AppAssets.exerciseTricepDips,
  ),
  const ExerciseEntity(
    name: AppTexts.squats,
    target: AppTexts.squatsTarget,
    technique: AppTexts.squatsTechnique,
    tip: AppTexts.squatsTip,
    image: AppAssets.exerciseSquats,
  ),
  const ExerciseEntity(
    name: AppTexts.lunges,
    target: AppTexts.lungesTarget,
    technique: AppTexts.lungesTechnique,
    tip: AppTexts.lungesTip,
    image: AppAssets.exerciseLunges,
  ),
  const ExerciseEntity(
    name: AppTexts.burpees,
    target: AppTexts.burpeesTarget,
    technique: AppTexts.burpeesTechnique,
    tip: AppTexts.burpeesTip,
    image: AppAssets.exerciseBurpees,
  ),
  const ExerciseEntity(
    name: AppTexts.jumpingJacks,
    target: AppTexts.jumpingJacksTarget,
    technique: AppTexts.jumpingJacksTechnique,
    tip: AppTexts.jumpingJacksTip,
    image: AppAssets.exerciseJumpingJacks,
  ),
  const ExerciseEntity(
    name: AppTexts.crunches,
    target: AppTexts.crunchesTarget,
    technique: AppTexts.crunchesTechnique,
    tip: AppTexts.crunchesTip,
    image: AppAssets.exerciseCrunches,
  ),
  const ExerciseEntity(
    name: AppTexts.bicycleCrunches,
    target: AppTexts.bicycleCrunchesTarget,
    technique: AppTexts.bicycleCrunchesTechnique,
    tip: AppTexts.bicycleCrunchesTip,
    image: AppAssets.exerciseBicycleCrunches,
  ),
  const ExerciseEntity(
    name: AppTexts.legRaises,
    target: AppTexts.legRaisesTarget,
    technique: AppTexts.legRaisesTechnique,
    tip: AppTexts.legRaisesTip,
    image: AppAssets.exerciseLegRaises,
  ),
];