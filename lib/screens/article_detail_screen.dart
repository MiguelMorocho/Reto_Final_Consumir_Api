import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:noticias_cineforo/articles/controllers/article_controller.dart';
import 'package:noticias_cineforo/articles/models/models.dart';
import 'package:share_plus/share_plus.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Article article =
        ModalRoute.of(context)!.settings.arguments as Article;

    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareArticle(article),
          ),
        ],
      ),
      body: GetBuilder<ArticleController>(
        init: ArticleController(article.id),
        builder: (_) {
          if (ArticleController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _buildArticleDetails(article);
          }
        },
      ),
    );
  }

  void _shareArticle(Article article) {
    final String textToShare =
        '${article.title}\n\n${DateFormat.yMMMMEEEEd('es').format(article.date)}\n\n${article.description}';

    Share.share(textToShare);
  }

  Widget _buildArticleDetails(Article article) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // if (article.image != null)
        //   Image.network(
        //     article.image!,
        //     fit: BoxFit.cover,
        //     height: 200,
        //   ),
        // const SizedBox(height: 10),
        Text(
          DateFormat.yMMMMEEEEd('es').format(article.date),
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          article.description,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 20),
        if (article.related.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Categorias:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                '#${article.related.map((relatedArticle) => relatedArticle.name).join(' #')}',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        // Otros detalles del artículo, si los hay
      ],
    );
  }
}
