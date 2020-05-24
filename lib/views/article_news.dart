import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutternews2/custom/custom_Scaffold.dart';
import 'package:flutternews2/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {
  String articleUrl;

  ArticleNews({this.articleUrl});

  @override
  _ArticleNewsState createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {
  final Completer<WebViewController> _completer =
  Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: Constants.app_name,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
            initialUrl: widget.articleUrl,
            onWebViewCreated: ((WebViewController webViewController) {
              _completer.complete(webViewController);
            })),
      ),
    );
  }
}
