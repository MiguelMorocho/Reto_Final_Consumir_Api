import 'package:get/get.dart';
import 'package:noticias_cineforo/forums/models/models.dart';
import 'package:noticias_cineforo/forums/providers/forums_provider.dart';

class ForumsController extends GetxController {
  final pageForums = <Forum>[];
  final String pageNumber;
  final forumsProvider = Get.find<ForumsProvider>();

  ForumsController(this.pageNumber);

  @override
  void onInit() {
    super.onInit();
    getForumByPage(pageNumber);
  }

  Future getForumByPage(String page) async {
    final forums = await forumsProvider.getForumByPage(page);

    pageForums.addAll(forums);
    update();
  }
}
