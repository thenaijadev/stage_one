import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nethive/app/presentation/screens/new/navigation_controls.dart';
import 'package:nethive/utilities/router/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

final provider = StateProvider((ref) => "");

class WebViewStack extends ConsumerStatefulWidget {
  const WebViewStack({
    required this.controller,
    super.key,
  });
  final WebViewController controller;

  @override
  ConsumerState<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends ConsumerState<WebViewStack> {
  var loadingPercentage = 0;

  bool isLoading = false;
  String theUrl = "";

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              isLoading = true;

              loadingPercentage = progress;
            });
          },
          onWebResourceError: (WebResourceError error) {
            if (error.isForMainFrame! == true ||
                error.errorCode.toString() == "-2" ||
                error.description.toString() ==
                    "net::ERR_INTERNET_DISCONNECTED") {
              Navigator.popAndPushNamed(context, Routes.noInternet);
            }
          },
          onPageFinished: (url) {
            final urlString = ref.read(provider.notifier);
            urlString.state = url;

            setState(() {
              isLoading = false;
              loadingPercentage = 100;
            });
          },
          onNavigationRequest: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('youtube.com')) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Blocking navigation to $host',
                  ),
                ),
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      // Modify from here...
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel(
        'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      );
    addFileSelectionListener(widget.controller);
    // ..loadRequest(
    //   Uri.parse("https://gdnportaldemo.nubiaville.com/"),
    // );
  }

  void addFileSelectionListener(WebViewController controller) async {
    if (Platform.isAndroid) {
      final androidController = controller.platform as AndroidWebViewController;
      await androidController.setOnShowFileSelector(_androidFilePicker);
    }
  }

  Future<List<String>> _androidFilePicker(
      final FileSelectorParams params) async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      return [file.uri.toString()];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1F5AA2),
        title: const Text('NETTHIVE'),
        // Add from here...
        actions: [
          NavigationControls(controller: widget.controller, url: theUrl),
          // Menu(controller: controller),
        ],
        // ...to here.
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: widget.controller,
          ),
          // isLoading ? Center(child: CircularProgressIndicator()) : Text(""),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ],
      ),
    );
  }
}
