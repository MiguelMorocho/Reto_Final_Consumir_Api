import 'package:get/get.dart';
import 'package:noticias_cineforo/forums/models/models.dart';
import 'package:noticias_cineforo/forums/providers/forum_provider.dart';

class ForumController extends GetxController {
  final articleProvider = Get.find<ForumProvider>();
  late final Forum forum;
  final String forumId;
  static bool isLoading =
      true; // Variable para indicar si el artículo está cargando

  ForumController(this.forumId);

  @override
  void onInit() {
    super.onInit();
    getForumById(forumId);
  }

  Future getForumById(String id) async {
    forum = await articleProvider.getForumDetail(id);
    isLoading =
        false; // Después de cargar el artículo, establece isLoading en false
    update();
  }
}
