part of 'features_bloc.dart';

sealed class FeaturesEvent extends Equatable {
  const FeaturesEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends FeaturesEvent {}

class ModerEvent extends FeaturesEvent {
  final String nameEv;

  const ModerEvent({required this.nameEv});
}

class UserAgentEvent extends FeaturesEvent {
  final String agent;
  const UserAgentEvent({required this.agent});
}

class LinkEvent extends FeaturesEvent {
  final String exercise;

  const LinkEvent({required this.exercise});
}

class TokenEvent extends FeaturesEvent {
  final String fcmVal;
  const TokenEvent({required this.fcmVal});
}
