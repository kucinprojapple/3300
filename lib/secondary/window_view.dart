import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart' show Toast;
import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;
import 'package:url_launcher/url_launcher_string.dart';

import '../app_core_design/colors.dart';
import 'features_constants.dart'
    show FeaturesConstants, aboutBlanck, httpKey, httpsKey;

class WindowView extends StatefulWidget {
  const WindowView({
    super.key,
    required this.viewId,
    required this.level,
    required this.webUri,
  });
  final String level;
  final int viewId;
  final WebUri webUri;

  @override
  State<WindowView> createState() => _WindowViewState();
}

class _WindowViewState extends State<WindowView> {
  final String _fontFamily = 'OtomanopeeOne';

  late String _level;
  late String resultUrl;
  late InAppWebViewController _controller;
  CookieManager cookieManager = CookieManager.instance();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    _level = widget.level;
    super.initState();
  }

  setCoockies(WebUri url) async {
    await cookieManager.setCookie(
      url: url,
      name: 'cookie energy',
      value: 'value-energy',
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // ignore: deprecated_member_use
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.mainColors.black.withValues(alpha: 0.4),
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        backgroundColor: AppColors.mainColors.black.withValues(alpha: 0.4),
        leading: Align(
          widthFactor: 1.0,
          alignment: Alignment.center,
          child: Text(''),
        ),
        trailing: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, size: 20, color: AppColors.mainColors.white),
        ),
      ),
      body: SizedBox(
        height: size.height - 5,
        child: SafeArea(
          bottom: false,
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: widget.webUri),
            windowId: widget.viewId,
            initialSettings: InAppWebViewSettings(
              incognito: false,
              thirdPartyCookiesEnabled: true,
              mediaPlaybackRequiresUserGesture: false,
              useShouldOverrideUrlLoading: true,
              useHybridComposition: true,
              allowsInlineMediaPlayback: true,
              userAgent: _level,
              javaScriptEnabled: true,
              javaScriptCanOpenWindowsAutomatically: true,
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
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            onCloseWindow: (controller) {
              if (mounted) {
                final canPop = Navigator.canPop(context);
                if (canPop) {
                  Navigator.pop(context);
                }
              }
            },
            onCreateWindow: (controller, createWindowAction) async {
              final urlNewWindow = createWindowAction.request.url;
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
                    level: _level,
                  );
                },
              );
              return true;
            },
            onLoadStop: (controller, url) {
              resultUrl = url.toString();
            },
            onExitFullscreen: (controller) {
              _controller.clearFocus();
            },
            shouldOverrideUrlLoading: (controller, action) async {
              String urlAction = action.request.url.toString();

              if (!urlAction.startsWith(httpKey) &&
                  !urlAction.startsWith(httpsKey)) {
                if (urlAction.toString() != aboutBlanck &&
                    urlAction.toString().isNotEmpty) {
                  launchIntent(urlAction);
                }
                return NavigationActionPolicy.CANCEL;
              }
              return NavigationActionPolicy.ALLOW;
            },
            onPermissionRequest: (contoller, permissionRequest) async {
              if (permissionRequest.resources.contains(
                PermissionResourceType.CAMERA,
              )) {
                final status = await Permission.camera.request();
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
}
