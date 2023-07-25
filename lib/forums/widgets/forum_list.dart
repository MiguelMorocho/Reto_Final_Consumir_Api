part of 'widgets.dart';

class ForumList extends StatelessWidget {
  final List<Forum> forums;

  const ForumList({Key? key, required this.forums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: forums.length,
        itemBuilder: (_, i) => GestureDetector(
          onTap: () {
            // Navegar a la pantalla de detalles del artículo al hacer tap en la noticia
            Navigator.pushNamed(context, '/forum', arguments: forums[i]);
          },
          child: ForumCard(forum: forums[i]),
        ),
      ),
    );
  }
}
