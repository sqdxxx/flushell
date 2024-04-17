
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatefulWidget {
  final String url;
  final String? title;

  const WebViewPage({super.key , required this.url, this.title});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title ?? ""),
        systemOverlayStyle: Theme.of(context).brightness == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark ,
      ),

      body: SafeArea(

        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted, // 允许JavaScript执行
        ),
      ),
    );
  }
}