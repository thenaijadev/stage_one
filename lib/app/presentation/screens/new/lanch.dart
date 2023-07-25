import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
import 'package:nethive/utilities/router/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late StreamSubscription<ConnectivityResult> subscription;
  final Uri _url = Uri.parse('https://gdnportaldemo.nubiaville.com');
  Future<void> _launchUrl() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        Navigator.popAndPushNamed(context, Routes.homeScreen);
      } else {
        if (!await launchUrl(
          _url,
          mode: LaunchMode.inAppWebView,
        )) {
          throw Exception('Could not launch $_url');
        }
      }
    });
    // if (connectivityResult != ConnectivityResult.none) {
    //   if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
    //     throw Exception('Could not launch $_url');
    //   }
    // }
  }

  @override
  void initState() {
    _launchUrl();
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 120.0, left: 20, right: 20, bottom: 110),
        child: Center(
          child: Card(
            elevation: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(Icons.error_outline, size: 50, color: Colors.red),
                    SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                        textAlign: TextAlign.center,
                        text:
                            "Sorry, you are not connected to the Internet. Please connect to the internet."),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
