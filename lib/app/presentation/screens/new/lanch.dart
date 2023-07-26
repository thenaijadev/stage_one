import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/screens/new/web_view_stack.dart';
import 'package:nethive/utilities/router/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late StreamSubscription<ConnectivityResult> subscription;

  Future<void> _launchUrl() async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        Navigator.pushNamed(context, Routes.noInternet);
      } else {}
    });
  }

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    _launchUrl();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://gdnportaldemo.nubiaville.com/'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewStack(controller: controller),
    );
  }
}
