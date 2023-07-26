import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nethive/app/presentation/screens/new/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NavigationControls extends ConsumerStatefulWidget {
  const NavigationControls(
      {required this.controller, super.key, required this.url});

  final WebViewController controller;
  final String url;

  @override
  ConsumerState<NavigationControls> createState() => _NavigationControlsState();
}

class _NavigationControlsState extends ConsumerState<NavigationControls> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        widget.url != "https://gdnportaldemo.nubiaville.com/admin/product_view"
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () async {
                  var urlString = ref.read(provider.notifier);

                  if (urlString.state ==
                      "https://gdnportaldemo.nubiaville.com/admin/product_view") {
                    return;
                  }
                  final messenger = ScaffoldMessenger.of(context);
                  if (await widget.controller.canGoBack()) {
                    await widget.controller.goBack();
                  } else {
                    messenger.showSnackBar(
                      const SnackBar(content: Text('No back history item')),
                    );
                    return;
                  }
                },
              )
            : Text(""),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            if (await widget.controller.canGoForward()) {
              await widget.controller.goForward();
            } else {
              messenger.showSnackBar(
                const SnackBar(content: Text('No forward history item')),
              );
              return;
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.replay),
          onPressed: () {
            widget.controller.reload();
          },
        ),
      ],
    );
  }
}
