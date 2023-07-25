import 'package:get/get.dart';
import 'package:noticias_cineforo/articles/models/models.dart';
import 'package:noticias_cineforo/articles/providers/articles_provider.dart';

class ArticlesController extends GetxController {
  final pageArticles = <Article>[];
  final articlesProvider = Get.find<ArticlesProvider>();
  final String pageNumber;

  ArticlesController(this.pageNumber);

  @override
  void onInit() {
    super.onInit();
    getArticlesByPage(pageNumber);
  }

  Future getArticlesByPage(String page) async {
    final articles = await articlesProvider.getArticlesByPage(page);

    pageArticles.addAll(articles);
    update();
  }
}
