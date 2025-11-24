import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features_repository.dart' show FeaturesRepository;

part 'features_event.dart';
part 'features_state.dart';

class FeaturesBloc extends Bloc<FeaturesEvent, FeaturesState> {
  late FeaturesRepository _coreRepository;
  final SharedPreferences _preferences;
  FeaturesBloc({required SharedPreferences preferences})
    : _preferences = preferences,
      super(FeaturesState()) {
    _coreRepository = FeaturesRepository(preferences: _preferences);
    on<InitEvent>(_onInit);
    add(InitEvent());
    on<ModerEvent>(_onModerEvent);
    on<LinkEvent>(_onLinkEvent);
    on<UserAgentEvent>(_onUserAgentEvent);
    on<TokenEvent>(_onFcmTokenEvent);
  }

  _onInit(InitEvent event, Emitter<FeaturesState> emit) {
    final secNameRes = _coreRepository.getModer();
    final exerciseRes = _coreRepository.getLink();
    final bonusAchivRes = _coreRepository.getUserAgnet();
    final fcmValue = _coreRepository.getToken();

    emit(
      state.copyWith(
        moder: secNameRes,
        link: exerciseRes,
        userAgent: bonusAchivRes,
        fcmToken: fcmValue,
      ),
    );
  }

  _onModerEvent(ModerEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(moder: event.nameEv));
    await _coreRepository.setModer(event.nameEv);
  }

  _onUserAgentEvent(UserAgentEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(userAgent: event.agent));
    await _coreRepository.setUserAgent(event.agent);
  }

  _onLinkEvent(LinkEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(link: event.exercise));
    await _coreRepository.setLink(event.exercise);
  }

  _onFcmTokenEvent(TokenEvent event, Emitter<FeaturesState> emit) async {
    emit(state.copyWith(fcmToken: event.fcmVal));
    await _coreRepository.setToken(event.fcmVal);
  }
}
