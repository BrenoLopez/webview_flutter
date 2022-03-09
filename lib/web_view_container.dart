import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  WebViewContainer(this.url);
  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  final _key = UniqueKey();
  _WebViewContainerState(this._url);
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _url,
                // onWebViewCreated: (WebViewController webViewController) {
                //   Map<String, String> headers = {
                //     "Authorization":
                //         "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImNhM0BnbWFpbC5jb20iLCJyb2xlcyI6WyJET0NUT1IiXSwiaWQiOiIyYjYyMDA5Ni0wZjU4LTQzNjMtOTk3NC02NTcyMWFiZjZjZjIiLCJpYXQiOjE2NDY3NjE0MDIsImV4cCI6MTY0NzYyNTQwMn0.5sS_vz2VC-28m_M76qawGZGZWAaUDW-AqSZ64x8F4hA"
                //   };
                //   webViewController.loadUrl(_url, headers: headers);
                // },
              ),
            )
          ],
        ));
  }
}
