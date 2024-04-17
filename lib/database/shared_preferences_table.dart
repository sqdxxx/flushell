
/*
* 使用 SharePreferences 模拟简单的数据库存储
* */

import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences _share;

mixin SharePreferencesTable<T> {

  // interface
  Map<String, dynamic> toJson();
  applyJson(Map<String, dynamic> json);

  static Future<List> all() async {

    final share = await SharedPreferences.getInstance();
    final json = share.getString('table');
    if (json == null) {
      return [];
    }
    return [];
    // return jsonDecode(json).;
  }

  static clear() {

  }

  static insert() {

  }

  static delete() {

  }


}