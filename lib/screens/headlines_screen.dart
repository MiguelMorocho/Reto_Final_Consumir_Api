import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:noticias_cineforo/articles/controllers/articles_contoller.dart';

import 'package:noticias_cineforo/articles/widgets/widgets.dart';
import 'package:noticias_cineforo/forums/controllers/forums_contoler.dart';
import 'package:noticias_cineforo/forums/widgets/widgets.dart';

import 'package:noticias_cineforo/witgets/custom_appbar.dart';

class HeadlinesScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HeadlinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    Get.put(ForumsController("1"));
    Get.put(ArticlesController("1"));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
        children: [
          const CustomAppbar(title: 'Headlines'),
          TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: Colors.black38,
            isScrollable: true,
            tabs: const [
              Tab(text: 'Noticias'),
              Tab(text: 'CineForo'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                GetBuilder<ArticlesController>(
                  builder: (_) => ArticleList(articles: _.pageArticles),
                ),
                GetBuilder<ForumsController>(
                  builder: (_) => ForumList(forums: _.pageForums),
                ),
                // const Icon(Icons.directions_car_filled_outlined),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
