import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:news_app/Controller/Api_controller.dart';
import 'package:news_app/Shared/Components.dart';

class Technology extends StatelessWidget {
  const Technology({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController  crt = Get.find();
    return ListView.builder(
      itemCount: crt.technology.length,
      itemBuilder: 
      (context, index) => ArticleWidget(article: crt.technology[index])
      );
  }
}