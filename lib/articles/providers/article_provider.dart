import 'package:get/get_connect/connect.dart';
import 'package:noticias_cineforo/articles/models/models.dart';

class ArticleProvider extends GetConnect {
  Future<Article> getArticleDetail(String id) async {
    final resp =
        await get('https://appmovil.utpl.edu.ec:8080/v1/news/show/$id');
    final articleResponse = ArticleResponse.fromMap(resp.body);
    return articleResponse.data;
  }
}
