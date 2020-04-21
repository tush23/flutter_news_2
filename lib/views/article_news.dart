import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleNews extends StatefulWidget {

  String articleUrl;
  ArticleNews({this.articleUrl});

  @override
  _ArticleNewsState createState() => _ArticleNewsState();
}

class _ArticleNewsState extends State<ArticleNews> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.white,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter",style: TextStyle(
              fontFamily: 'Product Sans'
             ),
            ),
            Text("News",style: TextStyle(
                color: Colors.blue[600],
                fontFamily: 'Product Sans',
              ),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
              opacity: 0,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.desktop_windows),
            ),
          )
        ],
        elevation: 0.0, 
      ),
        body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          })
        ),
      ),
    );
  }
}