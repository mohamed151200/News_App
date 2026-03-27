import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/Controller/Api_controller.dart';
import 'package:news_app/Controller/ThemeController.dart';
import 'package:news_app/Layout/Home.dart';
import 'package:news_app/remote/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  ApiClient.init();
  Get.put(ApiController());
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(), // لازم يكون موجود
      darkTheme: ThemeData.dark(), // ولازم ده كمان يكون موجود
      themeMode: themeController.initialTheme(),
      home: Home(),
    );
  }
}


