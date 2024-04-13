import 'package:dio/dio.dart';
import 'package:news_app_beta/models/article_model.dart';

class ServiceNewsApi {
  final Dio dio;
  const ServiceNewsApi({required this.dio});

  Future<List<ArticleModel>> getNews({required String categoryName}) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=6e549359a6a04ba9aa37a5c93886cc2d&category=$categoryName',
    );

    // get Data From Api And Parse To Map Object
    Map<String, dynamic> jsonData = response.data;

    // get Article List From Json Data
    List<dynamic> articlesListOfMap = jsonData['articles'];

    // Convert Articel List Of Map to Article List Of ArticleModel Object
    List<ArticleModel> articlesListOfModel = articlesListOfMap.map((article) {
      return ArticleModel.fromJson(article);
    }).toList();

    return articlesListOfModel;
  }
}
