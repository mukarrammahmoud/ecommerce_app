// ignore_for_file: unused_local_variable

import 'package:first_app/data/data_source/db.dart';

class LocalDataSource {
  final SqlDb sqldb;

  LocalDataSource({required this.sqldb});
  getCartFromLocal() async {
    SqlDb sqldb = SqlDb();
    List<Map<String, dynamic>> respone =
        await sqldb.readData("select * from cart");
   
  }
}
