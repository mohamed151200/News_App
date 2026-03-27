import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:news_app/Modules/Web_view/webViewController.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String title;
   // ignore: prefer_const_constructors_in_immutables
  WebViewScreen( {super.key, required this.url, required this.title});

 
  

  @override
  Widget build(BuildContext context) {
    final ctr=Get.put(NewsWebController(url));
    return Scaffold(
      appBar:AppBar(
        title: Text(title), // اسم الخبر اللي باعتينه
      ),
      body: WebViewWidget(controller: ctr.controller),
    );
  }
}