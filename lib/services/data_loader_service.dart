import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class DataLoaderService {
  Future<List<dynamic>> loadJsonList(String assetPath) async {
    final dataString = await rootBundle.loadString(assetPath);
    return jsonDecode(dataString) as List<dynamic>;
  }
}
