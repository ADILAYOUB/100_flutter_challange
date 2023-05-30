import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/wallpaper.dart';

class RestApiService {
  Future<List<dynamic>> getJsonDataFromApi(String url) async {
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var parsedData = jsonDecode(response.body) as List<dynamic>;
    return parsedData;
  }

  Future<List<Wallpaper>> convertJsonToObject(String url) async {
    List<dynamic> list = await getJsonDataFromApi(url);
    List<Wallpaper> wallpapaers = [];
    for (var wallpaper in list) {
      wallpapaers.add(Wallpaper.fromJson(wallpaper));
    }
    return wallpapaers;
  }
}
