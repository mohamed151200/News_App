import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news_app/Controller/Api_controller.dart';
import 'package:news_app/Controller/ThemeController.dart';
import 'package:news_app/Modules/News.dart';
import 'package:news_app/Modules/Sports.dart';
import 'package:news_app/Modules/Technology.dart';

class Home extends StatelessWidget {
  Home({super.key});
  List<Widget> pages = [
    //==0
    News(), //==1
    Sports(), //==2
    Technology(), //==3
  ];
  @override
  Widget build(BuildContext context) {
    final ApiController crt = Get.find();
    final ThemeController themeCrt = Get.find();

    return Scaffold(
      body: Obx(() => pages[crt.index.value]),
      
      appBar: AppBar(title: Obx(() => Text(style:TextStyle(fontWeight:FontWeight(1000)),crt.titles[crt.index.value])),
      actions: [
        IconButton(onPressed: () 
        {
          themeCrt.toggleTheme();
        }, icon: Obx( () => Icon(themeCrt.isDarkMode.value ? Icons.light_mode : Icons.dark_mode)))
      ],
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: crt.index.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: 'News',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
            BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              label: 'technology',
            ),
          ],

          onTap: (value) => crt.changeIndex(value),
        ),
      ),
    );
  }
}
