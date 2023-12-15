import 'dart:convert';
// import 'dart:html';

import 'package:instaclone/home_api/repo_api.dart';
// import 'package:instagram/home_api/repo_api.dart';
import 'package:http/http.dart' as http;

class HomeIntagrationApi {
  var data = [];
  List<HomeIntialApi> result = [];
  static const _homesiteUrl =
      "https://pixabay.com/api/?key=40832173-a2f431965204aeb7652b3cb0f&q=yellow+flowers&image_type=photo";

  Future<List<HomeIntialApi>> gethomeitems({String? query}) async {
    final respons = await http.get(Uri.parse(_homesiteUrl));

    try {
      if (respons.statusCode == 200) {
        data = json.decode(respons.body)["hits"] as List;
        print(data.toString());
        result = data.map((e) => HomeIntialApi.fromJson(e)).toList();
        if (query != null) {
          result = result
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print("Somthinf Hppend");
      }
    } on Exception catch (e) {
      print('error:$e');
    }
    return result;
  }
}
