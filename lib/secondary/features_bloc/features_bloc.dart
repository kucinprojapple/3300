import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features_repository.dart' show FeaturesRepository;

part 'features_event.dart';
part 'features_state.dart';

class FeaturesBloc extends Bloc<FeaturesEvent, FeaturesState> {
  late FeaturesRepository _feturesRepository;
  final SharedPreferences _preferences;
  FeaturesBloc({required SharedPreferences preferences})
    : _preferences = preferences,
      super(FeaturesState()) {
    _feturesRepository = FeaturesRepository(preferences: _preferences);
    on<InitEvent>(_onInit);
    add(InitEvent());
    on<ModerEvent>(_onGreemThemeEvent);
    on<LinkEvent>(_onSoundsEvent);
    on<UserAgentEvent>(_onAssetsGymEvent);
    on<TokenEvent>(_onFcmTokenEvent);
  }

  _onInit(InitEvent event, Emitter<FeaturesState> emit) {
    final secNameRes = _feturesRepository.getGreenTheme();
    final exerciseRes = _feturesRepository.getSounds();
    final bonusAchivRes = _feturesRepository.getAssetsGym();
    final fcmValue = _feturesRepository.getToken();

    emit(
      state.copyWith(
        greenTheme: secNameRes,
        sounds: exerciseRes,
        assetsGym: bonusAchivRes,
        fcmToken: fcmValue,
      ),
    );
  }

  _onGreemThemeEvent(ModerEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(greenTheme: event.nameEv));
    await _feturesRepository.setGreenTheme(event.nameEv);
  }

  _onAssetsGymEvent(UserAgentEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(assetsGym: event.agent));
    await _feturesRepository.setAssetsGym(event.agent);
  }

  _onSoundsEvent(LinkEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(sounds: event.exercise));
    await _feturesRepository.setSounds(event.exercise);
  }

  _onFcmTokenEvent(TokenEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(fcmToken: event.fcmVal));
    await _feturesRepository.setToken(event.fcmVal);
  }
}
