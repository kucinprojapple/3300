import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/local_storage_service.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final LocalStorageService storage;

  SettingsCubit(this.storage)
    : super(
        SettingsState(
          sound: storage.soundEnabled,
          music: storage.musicEnabled,
          vibration: storage.vibrationEnabled,
          timer: storage.timerDuration,
        ),
      );

  void toggleSound(bool value) => emit(state.copyWith(sound: value));

  void toggleMusic(bool value) => emit(state.copyWith(music: value));

  void toggleVibration(bool value) => emit(state.copyWith(vibration: value));

  void selectTimer(int seconds) => emit(state.copyWith(timer: seconds));

  Future<void> save() async {
    storage
      ..soundEnabled = state.sound
      ..musicEnabled = state.music
      ..vibrationEnabled = state.vibration
      ..timerDuration = state.timer;
  }
}
