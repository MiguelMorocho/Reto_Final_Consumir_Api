import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noticias_cineforo/articles/providers/article_provider.dart';
import 'package:noticias_cineforo/articles/providers/articles_provider.dart';
import 'package:noticias_cineforo/config/theme/app_theme.dart';
import 'package:noticias_cineforo/forums/providers/forum_provider.dart';
import 'package:noticias_cineforo/forums/providers/forums_provider.dart';
import 'package:noticias_cineforo/screens/article_detail_screen.dart';
import 'package:noticias_cineforo/screens/forum_detail_screen.dart';
import 'package:noticias_cineforo/screens/headlines_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  Get.lazyPut(() => ArticlesProvider());
  Get.lazyPut(() => ArticleProvider());
  Get.lazyPut(() => ForumProvider());
  Get.lazyPut(() => ForumsProvider());

  initializeDateFormatting('es').then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'headlines',
      theme: AppTheme().theme(),
      routes: {
        'headlines': (context) => const HeadlinesScreen(),
        '/article': (context) => const ArticleDetailScreen(),
        '/forum': (context) => const ForumDetailScreen(),
      },
    );
  }
}
