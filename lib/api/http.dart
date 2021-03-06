import 'dart:convert';

import 'package:flutter_yuedu/model/response.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';
import 'api.dart';

class Http {
  static Future<Response> get(String url,
      {String query, String version = kVersion}) async {
    var response = await http.get(Api(url, version: version).toString());
    var result = json.decode(response.body);

    if (response.statusCode != 200) {
      throw Exception(result);
    }
    return Response.fromJsonMap(result);
  }

  static Future<Response> post(String url,
      {body, String version = kVersion}) async {
    var response =
        await http.post(Api(url, version: version).toString(), body: body);
    var result = json.decode(response.body);

    return Response.fromJsonMap(result);
  }
}
