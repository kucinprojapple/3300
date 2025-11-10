import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatefulWidget {
  final String url;

  const PrivacyPolicyScreen({super.key, required this.url});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: Column(
        children: [
          if (progress < 1.0) LinearProgressIndicator(value: progress),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(widget.url)),
              onProgressChanged: (controller, progressValue) {
                setState(() {
                  progress = progressValue / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
