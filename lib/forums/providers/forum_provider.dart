import 'package:get/get_connect/connect.dart';
import 'package:noticias_cineforo/forums/models/models.dart';

class ForumProvider extends GetConnect {
  Future<Forum> getForumDetail(String id) async {
    final resp = await get(
        'https://appmovil.utpl.edu.ec:8080/v2/library/benjamin/cine/forum/show/$id');
    final forumResponse = ForumResponse.fromMap(resp.body);
    return forumResponse.data;
  }
}
