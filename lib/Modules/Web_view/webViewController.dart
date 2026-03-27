import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

// غيرنا الاسم هنا عشان ميبقاش زي اسم المكتبة
class NewsWebController extends GetxController {
  late final WebViewController controller; // دي بتاعة المكتبة الأصلية
  final String url;

  NewsWebController(this.url); // بناخد الـ url في الـ Constructor

  @override
  void onInit() {
    super.onInit();
    // هنا بنعرف الـ controller بـ نضافة
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
             print("بدأت أحمل الخبر..");
          },
          onPageFinished: (url) {
             print("خلصت تحميل!");
          },
        ),
      )
      ..loadRequest(Uri.parse(url)); // الـ url اللي باعتينه للكنترولر
  }
}