class ArticleModel {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;
  final String sourceName; // سحبنا الاسم هنا مباشرة

  ArticleModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.sourceName,
  });

  // ميثود الـ fromJson "الساحرة" اللي بتدخل جوه الـ Map التانية
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'],
      title: json['title'] ?? 'No Title',
      description: json['description'],
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'],
      // هنا السحر: دخلنا جوه 'source' وجبنا الـ 'name' في خطوة واحدة
      sourceName: json['source']['name'] ?? 'Unknown Source', 
    );
  }
}