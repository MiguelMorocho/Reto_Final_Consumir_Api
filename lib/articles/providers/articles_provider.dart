import 'package:get/get_connect/connect.dart';
import 'package:noticias_cineforo/articles/models/models.dart';

class ArticlesProvider extends GetConnect {
  Future<List<Article>> getArticlesByPage(String page) async {
    final resp =
        await get('https://appmovil.utpl.edu.ec:8080/v1/news/all?page=$page');
    final articlesResponse = ArticlesResponse.fromMap(resp.body);
    return articlesResponse.data;
  }
}
