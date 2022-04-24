import 'dart:convert';

import 'package:find_track_app/requests/post_model.dart';
import 'package:http/http.dart';

class RequestRepo {
  final String postsUrl = "https://api.audd.io/";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "No se puede obtener la información";
    }
  }
}
