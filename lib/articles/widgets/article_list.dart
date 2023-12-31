part of 'widgets.dart';

class ArticleList extends StatelessWidget {
  final List<Article> articles;

  const ArticleList({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (_, i) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/article', arguments: articles[i]);
          },
          child: ArticleCard(article: articles[i]),
        ),
      ),
    );
  }
}
