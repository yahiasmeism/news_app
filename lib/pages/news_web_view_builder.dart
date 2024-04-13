import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebViewBuilder extends StatefulWidget {
  const NewsWebViewBuilder({super.key, required this.url});
  final String url;
  @override
  State<NewsWebViewBuilder> createState() => _NewsWebViewBuilderState();
}

class _NewsWebViewBuilderState extends State<NewsWebViewBuilder> {
  late WebViewController controller;
  var loadingPercentage = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) {
          setState(() {
            isLoading = false;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Container(
              height: 2,
              color: Colors.amber,
              width:
                  MediaQuery.of(context).size.width * (loadingPercentage / 100))
          : WebViewWidget(controller: controller),
    );
  }
}
