import 'package:get/get.dart'; // استخدم المكتبة الأم أسهل
import 'package:news_app/Shared/Secrets.dart';
import 'package:news_app/models/ArticleModel.dart';
import 'package:news_app/remote/api_client.dart';

class ApiController extends GetxController { // سميه صح عشان الـ Convention
  final String  _apiKey=Secrets.apiKey;  
  // الـ Variables بتاعتك زي الفل
  var sports = <ArticleModel>[].obs;
  var news = <ArticleModel>[].obs;
  var technology = <ArticleModel>[].obs;
  var index = 0.obs;
  List<String> titles = [
    'News',
    'Sports',
    'Technology',
    
  ];
  @override
  void onInit() {
    getNews();
    getSports();  
    getTechnology();
    super.onInit();
  }

  //_________________________________________________________________________________
  void getSports() async => sports.assignAll(await fetchArticles("sports"));
  void getNews() async => news.assignAll(await fetchArticles("general"));
  void getTechnology() async => technology.assignAll(await fetchArticles("technology"));
  //_________________________________________________________________________________


  changeIndex(int i) {
    index.value = i;
  }

//_________________________________________________________________________________



  Future<List<ArticleModel>> fetchArticles(String category) async {
    try {
      // ركز في الـ URL والـ Query هنا يا وحش
      var response = await ApiClient.dio.get( // نادينا dio مباشرة
        "top-headlines", 
        queryParameters: {
          "country": "us", // لازم تحدد بلد أو لغة
          "category": category, 
          "apiKey": _apiKey, 
          'maxResults': 10,
        },
      );

      if (response.data["articles"] != null) {
        List articles = response.data["articles"];
        return articles.map((e) => ArticleModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("__________________________________________________Error in fetch: $e"); // عشان نعرف لو الـ Key فيه مشكلة
        return [];
    }
  }
}