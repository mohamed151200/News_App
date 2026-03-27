import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:news_app/Modules/Web_view/Web_View.dart';
import 'package:news_app/models/ArticleModel.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleModel article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(WebViewScreen( url: article.url, title: article.title,));
      },
      child: Card(
        elevation: 4.0, // رفعة خفيفة عشان الفخامة
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // حتة الصورة - محمية من الـ Null بـ شكل شيك
              if (article.urlToImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage!,
                    height: 180.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Container(
                      height: 180.0,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 50.0),
                    ),
                  ),
                ),
              if (article.urlToImage != null) const SizedBox(height: 12.0),
      
              // حتة العنوان - قوية ومحمية
              Text(
                article.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8.0),
      
              // حتة الوصف (البذة) - خفيفة
              if (article.description != null)
                Text(
                  article.description!,
                  style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 12.0),
      
              // حتة البيانات التحتية - Row شياكة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.sourceName,
                    style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.blueAccent),
                  ),
                  Text(
                    // هنا ممكن تستخدم package زي intl عشان تضبط شكل الوقت
                    article.publishedAt.split('T')[0], // بسطنا الوقت لـ تاريخ
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}