import 'package:get/get.dart';
import 'package:noticias_cineforo/articles/models/models.dart';
import 'package:noticias_cineforo/articles/providers/article_provider.dart';

class ArticleController extends GetxController {
  final articleProvider = Get.find<ArticleProvider>();
  late final Article article;
  final String articleId;
  static bool isLoading = true; // Variable para indicar si el artículo está cargando

  ArticleController(this.articleId);

  @override
  void onInit() {
    super.onInit();
    getArticleById(articleId);
  }

  Future getArticleById(String id) async {
    article = await articleProvider.getArticleDetail(id);
    isLoading =
        false; // Después de cargar el artículo, establece isLoading en false
    update();
  }
}
