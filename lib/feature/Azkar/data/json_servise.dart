import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islami_app/feature/Azkar/data/models/zeker_json_model.dart/zeker_json_model.dart';

class AzkarProvider {
  static Future<List<Azkar>> loadAzkar() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/azkarJson/adkar.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      List<Azkar> azkarList = [];
      jsonMap.forEach((category, azkarItems) {
        List<Zekr> zekrList =
            (azkarItems as List).map((item) => Zekr.fromJson(item)).toList();
        azkarList.add(Azkar(category: category, azkar: zekrList));
      });
      return azkarList;
    } on Exception {
      //print("⚠️ خطأ أثناء تحميل البيانات: $e");
      return [];
    }
  }
}
