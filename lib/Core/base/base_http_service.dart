import 'dart:convert';
import 'dart:io';

import 'package:dating_app/Core/base/api_end_point.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseHttpService {
  final Client _client = Client();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    "end_client": "app"
  };
  String token = '';
  String googleIdToken = '';

  Future<void> _initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    token = prefs.getString("auth_token") ?? "";
    headers['authorization'] = token;
    if (Platform.isAndroid || Platform.isIOS) {
      headers['end_client'] = Platform.isIOS ? "ios" : "android";
    }
  }

  Future<Response?> post({
    required String url,
    required Map<String, dynamic> body,
    Map<String, String> customHeader = const {},
  }) async {
    await _initialize();
    Map<String, String> headers = this.headers;
    customHeader.forEach((key, value) {
      headers[key] = value;
    });

    return await _client.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  Future<Response?> patch(
      {required String url, required Map<String, dynamic> body}) async {
    await _initialize();
    return await _client.patch(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  Future<Response?> delete({required String url}) async {
    await _initialize();
    return await _client.delete(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<String?> multipartPost({required File file}) async {
    var request = MultipartRequest(
      "POST",
      Uri.parse(ApiEndPoints.uploadImage),
    );

    print(Uri.parse(ApiEndPoints.uploadImage));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("auth_token") ?? "";
    request.headers['authorization'] = token;
    MultipartFile mtpFile = await MultipartFile.fromPath(
      "file",
      file.path,
      filename: file.path.split("/").last,
    );
    if (kDebugMode) {
      print(mtpFile.field);
      print(mtpFile.contentType);
    }
    request.files.add(mtpFile);
    return await request.send().then((value) => value.stream.bytesToString());
  }

  Future<Response?> get({required String url}) async {
    await _initialize();
    return await _client.get(Uri.parse(url), headers: headers);
  }
}
