import 'package:intl/intl.dart';

class DashboardController{
  static String? languageId;
  late String todayDate;
  String imagePathField = 'picture';
  String titleField = 'firstName';
  String descField = 'id';

  DashboardController() {
    getTodayDate();
  }

  Future<void> getTodayDate() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(now);
    todayDate = formatted;
  }
}