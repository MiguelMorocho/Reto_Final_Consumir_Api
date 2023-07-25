import 'package:get/get_connect/connect.dart';
import 'package:noticias_cineforo/forums/models/models.dart';

class ForumsProvider extends GetConnect {
  Future<List<Forum>> getForumByPage(String page) async {
    final resp = await get(
        'https://appmovil.utpl.edu.ec:8080/v2/library/benjamin/cine/forum/all?page=$page');
    final forumsResponse = ForumsResponse.fromMap(resp.body);
    return forumsResponse.data;
  }
}
