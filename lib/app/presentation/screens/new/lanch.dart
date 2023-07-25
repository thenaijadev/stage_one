import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:nethive/app/presentation/widgets/title_text.dart';
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
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result == ConnectivityResult.none) {
        Navigator.pop(context);
      } else {
        if (!await launchUrl(
          _url,
          mode: LaunchMode.inAppWebView,
        )) {
          throw Exception('Could not launch $_url');
        }
      }
    });
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
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/no_internet.png"),
              const TextWidget(
                text: "No Internet Connection",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text: "Please check your internet connection and try again.",
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.none) {
                    return;
                  } else {
                    if (!await launchUrl(_url, mode: LaunchMode.inAppWebView)) {
                      throw Exception('Could not launch $_url');
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 0, 44, 139),
                  ),
                  child: const Center(
                    child: TextWidget(
                      text: "Try again",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
