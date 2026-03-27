import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:news_app/Controller/Api_controller.dart';
import 'package:news_app/Shared/Components.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController  crt = Get.find();
    return Obx(()
    {
      return crt.news.isNotEmpty?ListView.builder(
      itemCount: crt.news.length,
      itemBuilder: 
      (context, index) => ArticleWidget(article: crt.news[index])
      ):Center(child: CircularProgressIndicator());

    });
  }
}