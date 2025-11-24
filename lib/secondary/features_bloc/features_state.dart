// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'features_bloc.dart';

class FeaturesState extends Equatable {
  final String moder;
  final String link;
  final String userAgent;
  final String fcmToken;

  const FeaturesState({
    this.moder = '',
    this.link = '',
    this.userAgent = '',
    this.fcmToken = '',
  });

  @override
  List<Object> get props => [link, userAgent, moder, fcmToken];

  FeaturesState copyWith({
    String? moder,
    String? link,
    String? userAgent,
    String? fcmToken,
  }) {
    return FeaturesState(
      moder: moder ?? this.moder,
      link: link ?? this.link,
      userAgent: userAgent ?? this.userAgent,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }
}
