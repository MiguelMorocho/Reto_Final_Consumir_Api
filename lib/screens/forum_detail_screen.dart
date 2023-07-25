import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:noticias_cineforo/forums/controllers/forum_contoller.dart';
import 'package:noticias_cineforo/forums/models/models.dart';
import 'package:share_plus/share_plus.dart';

class ForumDetailScreen extends StatelessWidget {
  const ForumDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Forum forum = ModalRoute.of(context)!.settings.arguments as Forum;
    return Scaffold(
      appBar: AppBar(
        title: Text(forum.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => _shareArticle(forum),
          ),
        ],
      ),
      body: GetBuilder<ForumController>(
        init: ForumController(forum.id),
        builder: (_) {
          if (ForumController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return _buildForumDetails(_.forum);
          }
        },
      ),
    );
  }

  void _shareArticle(Forum forum) {
    final String textToShare =
        '${forum.title}\n\n${DateFormat.yMMMMEEEEd('es').format(forum.date)}\n\n${forum.description}';

    Share.share(textToShare);
  }

  Widget _buildForumDetails(Forum forum) {
    // Aquí puedes diseñar la interfaz gráfica para mostrar los detalles del artículo
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            forum.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(DateFormat.yMMMMEEEEd('es').format(forum.date)),
          const SizedBox(height: 10),
          Text(forum.related[0].name),
          const SizedBox(height: 10),
          Text(forum.related[1].name),
          // Otros widgets para mostrar más detalles del artículo
        ],
      ),
    );
  }
}
