part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool sound;
  final bool music;
  final bool vibration;
  final int timer;

  const SettingsState({
    required this.sound,
    required this.music,
    required this.vibration,
    required this.timer,
  });

  SettingsState copyWith({
    bool? sound,
    bool? music,
    bool? vibration,
    int? timer,
  }) {
    return SettingsState(
      sound: sound ?? this.sound,
      music: music ?? this.music,
      vibration: vibration ?? this.vibration,
      timer: timer ?? this.timer,
    );
  }

  @override
  List<Object> get props => [sound, music, vibration, timer];
}
