import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    show FirebaseMessaging;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_gym_club/background.dart';
import 'package:green_gym_club/features/lost_network/view/lost_network_screen.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart' show Toast;

import 'package:url_launcher/url_launcher.dart'
    show LaunchMode, canLaunchUrl, launchUrl;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../app_core_design/colors.dart';
import '../app_core_design/text_styles.dart' show AppTextStyles;

import '../core/router/router.dart';
import 'animation_loader.dart';
import 'window_view.dart' show WindowView;
import 'connectivity_bloc/connectivity_bloc.dart'
    show
        ConnectivityBloc,
        ConnectivityFailure,
        ConnectivityInitial,
        ConnectivityState,
        ConnectivitySuccess;
import 'features_bloc/features_bloc.dart'
    show FeaturesBloc, LinkEvent, ModerEvent;
import 'features_constants.dart'
    show FeaturesConstants, aboutBlanck, domen, httpKey, httpsKey, rush, debkey;

class WebviewViewBuilder extends StatefulWidget {
  const WebviewViewBuilder({
    super.key,
    required this.link,
    required this.saved,
    required this.userAgent,
  });
  final String link;
  final String userAgent;
  final bool saved;

  @override
  State<WebviewViewBuilder> createState() => _WebviewViewBuilderState();
}

class _WebviewViewBuilderState extends State<WebviewViewBuilder> {
  final String _fontFamily = 'OtomanopeeOne';

  late InAppWebViewController _controller;

  CookieManager cookieManager = CookieManager.instance();
  late String _baseLink;

  late String _userAgent;
  bool isSaved = false;
  int flexCount = 0;
  late bool offFirst;
  late bool offSecond;
  late bool _db;
  late String resultUrl;

  @override
  void initState() {
    super.initState();

    _userAgent = widget.userAgent;
    _db = widget.saved;
    _baseLink = widget.link;
    if (_db) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      offFirst = false;
      offSecond = true;
    }
    if (!_db) {
      flexCount = 1;
      offSecond = false;
      offFirst = true;
    }
    log('$debkey _baseLink $_baseLink');
    log('$debkey _userAgent $_userAgent');
  }

  setCoockies(WebUri url) async {
    await cookieManager.setCookie(
      url: url,
      name: 'cookie energy',
      value: 'value',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: AppBar(backgroundColor: AppColors.mainColors.black),
      ),
      backgroundColor: AppColors.mainColors.black,
      // ignore: deprecated_member_use
      body: WillPopScope(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return BlocListener<ConnectivityBloc, ConnectivityState>(
              listener: (context, state) {
                if (state is ConnectivityFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      content: Center(
                        child: Text(
                          FeaturesConstants.lostConnection,
                          style: AppTextStyles.headers(context).xs,
                        ),
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
                builder: (context, state) {
                  if (state is ConnectivityFailure ||
                      state is ConnectivityInitial) {
                    return LostNetworkScreen();
                  }
                  if (state is ConnectivitySuccess) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Offstage(
                          offstage: offFirst,
                          child: Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            color: Colors.black,
                            child: SafeArea(
                              bottom: false,
                              child: InAppWebView(
                                initialSettings: InAppWebViewSettings(
                                  incognito: false,
                                  javaScriptCanOpenWindowsAutomatically: true,
                                  thirdPartyCookiesEnabled: true,
                                  mediaPlaybackRequiresUserGesture: false,
                                  useShouldOverrideUrlLoading: true,
                                  useHybridComposition: true,
                                  allowsInlineMediaPlayback: true,
                                  userAgent: _userAgent,
                                  javaScriptEnabled: true,
                                  verticalScrollBarEnabled: false,
                                  horizontalScrollBarEnabled: false,
                                  cacheEnabled: true,
                                  disableVerticalScroll: false,
                                  disableHorizontalScroll: false,
                                  supportZoom: true,
                                  allowFileAccessFromFileURLs: true,
                                  allowUniversalAccessFromFileURLs: true,
                                  useOnNavigationResponse: false,
                                  supportMultipleWindows: true,
                                ),
                                onCreateWindow: (
                                  controller,
                                  createWindowAction,
                                ) async {
                                  final urlNewWindow =
                                      createWindowAction.request.url;
                                  final id = createWindowAction.windowId;
                                  await showCupertinoModalBottomSheet(
                                    expand: true,
                                    enableDrag: false,
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return WindowView(
                                        webUri: urlNewWindow!,
                                        viewId: id,
                                        level: _userAgent,
                                      );
                                    },
                                  );
                                  return true;
                                },
                                onWebViewCreated: (controller) {
                                  _controller = controller;
                                  _controller.loadUrl(
                                    urlRequest: URLRequest(
                                      url: WebUri.uri(Uri.parse(_baseLink)),
                                    ),
                                  );
                                },
                                onLoadStop: (controller, url) {
                                  resultUrl = url.toString();
                                  if (url != null) {
                                    setCoockies(url);
                                  }
                                  if (!_db && !isSaved) {
                                    if (resultUrl == _baseLink) {
                                      context.router.pushNamed('/lost_network');
                                      // context.router.pushPathState('/lost_network');
                                    } else if (resultUrl.startsWith(rush) ||
                                        resultUrl.startsWith(domen)) {
                                      context.read<FeaturesBloc>().add(
                                        ModerEvent(nameEv: 'gymgym'),
                                      );
                                      FirebaseMessaging.instance.deleteToken();
                                      setState(() {
                                        isSaved = true;
                                      });
                                      // context.router.popUntilRouteWithPath(
                                      //   '/onboarding',
                                      // );
                                      context.router.replace(
                                        const OnboardingRoute(),
                                      );
                                    } else {
                                      context.read<FeaturesBloc>().add(
                                        LinkEvent(exercise: resultUrl),
                                      );
                                      setState(() {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.portraitUp,
                                          DeviceOrientation.portraitDown,
                                          DeviceOrientation.landscapeLeft,
                                          DeviceOrientation.landscapeRight,
                                        ]);
                                        isSaved = true;
                                        offSecond = true;
                                        offFirst = false;
                                        flexCount = 0;
                                      });
                                    }
                                  }
                                },
                                onExitFullscreen: (controller) {
                                  _controller.clearFocus();
                                },
                                shouldOverrideUrlLoading: (
                                  controller,
                                  action,
                                ) async {
                                  String urlAction =
                                      action.request.url.toString();
                                  if (!urlAction.startsWith(httpKey) &&
                                      !urlAction.startsWith(httpsKey)) {
                                    if (urlAction.toString() != aboutBlanck &&
                                        urlAction.toString().isNotEmpty) {
                                      launchIntent(urlAction);
                                    }
                                  }
                                  return NavigationActionPolicy.ALLOW;
                                },
                                onPermissionRequest: (
                                  controller,
                                  permissionRequest,
                                ) async {
                                  if (permissionRequest.resources.contains(
                                        PermissionResourceType
                                            .CAMERA_AND_MICROPHONE,
                                      ) ||
                                      permissionRequest.resources.contains(
                                        PermissionResourceType.CAMERA,
                                      )) {
                                    final status =
                                        await Permission.camera.request();
                                    if (status.isGranted) {
                                      return PermissionResponse(
                                        action: PermissionResponseAction.GRANT,
                                        resources: permissionRequest.resources,
                                      );
                                    }
                                    if (status.isDenied) {
                                      return PermissionResponse(
                                        action: PermissionResponseAction.DENY,
                                        resources: permissionRequest.resources,
                                      );
                                    }
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: flexCount,
                          child: Offstage(
                            offstage: offSecond,
                            child: AppMainBackground(
                              child: AnimationLoader(
                                zero: false,
                                isFirstOpen: true,
                                first: false,
                                second: true,
                                onComplete: () {},
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return const Visibility(visible: false, child: Center());
                },
              ),
            );
          },
        ),
        onWillPop: () async {
          if (await _controller.canGoBack()) {
            var emptyString = await _controller.getUrl();
            if (emptyString.toString() == resultUrl) {
              await _controller.goBack();
              await _controller.goBack();
            } else {
              await _controller.goBack();
            }
            return false;
          } else {
            return false;
          }
        },
      ),
    );
  }

  void launchIntent(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        Toast.show(
          FeaturesConstants.noAnySupprted,
          gravity: 0,
          duration: 2,
          textStyle: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 19,
            letterSpacing: 0.1,
            color: AppColors.mainColors.white,
          ),
        );
      }
    }
  }

  // void showSnakBar(String text) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: AppColors.accent.primary,
  //       content: Center(
  //         child: Text(
  //           text,
  //           style: AppTextStyles.tinyBody(
  //             context,
  //           ).l.apply(color: AppColors.main.white),
  //         ),
  //       ),
  //       duration: Duration(seconds: 3),
  //     ),
  //   );
  // }
}
