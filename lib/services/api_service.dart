import 'dart:convert';
import 'package:api_with_models_flutter/models/album_model.dart';
import 'package:http/http.dart' as http;

Future<List<AlbumModel>> getAlbums() async {
  String url = "https://jsonplaceholder.typicode.com/albums";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);

    final List<AlbumModel> albumList = [];

    for (var i = 0; i < json.length; i++) {
      var album = AlbumModel.fromJson(json[i]);
      albumList.add(album);
    }

    return albumList;
  } else {
    throw Exception("Error");
  }
}
