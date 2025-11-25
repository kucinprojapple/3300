// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'features_bloc.dart';

class FeaturesState extends Equatable {
  final String greenTheme;
  final String sounds;
  final String assetsGym;
  final String fcmToken;

  const FeaturesState({
    this.greenTheme = '',
    this.sounds = '',
    this.assetsGym = '',
    this.fcmToken = '',
  });

  @override
  List<Object> get props => [sounds, assetsGym, greenTheme, fcmToken];

  FeaturesState copyWith({
    String? greenTheme,
    String? sounds,
    String? assetsGym,
    String? fcmToken,
  }) {
    return FeaturesState(
      greenTheme: greenTheme ?? this.greenTheme,
      sounds: sounds ?? this.sounds,
      assetsGym: assetsGym ?? this.assetsGym,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
