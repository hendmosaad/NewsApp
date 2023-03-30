import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter/material.dart';
class WebViewScreen extends StatelessWidget {
     String  uri;
    WebViewScreen(this.uri);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:WebViewWidget(
        controller:WebViewController()..loadRequest(Uri.parse('${uri}')) ,
      )

    );
  }
}
