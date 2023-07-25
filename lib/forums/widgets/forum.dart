part of 'widgets.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  const ForumCard({Key? key, required this.forum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ForumImage(url: forum.image.thumb),
        _ForumSourceAndTitle(
            date: forum.related[0].name, title: forum.title),
        _ForumDescription(
            description: forum.description.split('\n\n').first),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _ForumDescription extends StatelessWidget {
  final String description;

  const _ForumDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Text(description),
    );
  }
}

class _ForumSourceAndTitle extends StatelessWidget {
  final String date;
  final String title;

  const _ForumSourceAndTitle({
    Key? key,
    required this.date,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueAccent),
            ),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ));
  }
}

class _ForumImage extends StatelessWidget {
  final String url;

  const _ForumImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: FadeInImage(
        fit: BoxFit.cover,
        width: double.infinity,
        height: 200,
        placeholder: const AssetImage('assets/loading.gif'),
        image: NetworkImage(url),
      ),
    );
  }
}
