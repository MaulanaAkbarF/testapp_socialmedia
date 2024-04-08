import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Services/BackendIntegration/DummyAPI/HTTP_Request.dart';

class PostsController{
  static String? languageId;
  late String todayDate;
  List<RxString> textCounterLike = [];
  String idPostData = 'owner';
  String imagePathUserField = 'picture';
  String firstNameUserField = 'firstName';
  String lastNameUserField = 'lastName';
  String timeUserField = 'publishDate';

  String imagePathField = 'image';
  String titleField = 'text';
  String descField = 'id';

  PostsController() {
    getTodayDate();
  }

  Future<void> getTodayDate() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(now);
    todayDate = formatted;
  }
}
