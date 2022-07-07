import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseHttpService {
  final Client _client = Client();
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String token = '';

  Future<void> _initialize() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("auth_token") ?? "";
    headers['authorization'] = token;
  }

  Future<Response?> post(
      {required String url, required Map<String, dynamic> body}) async {
    await _initialize();
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

  Future<Response?> delete(
      {required String url}) async {
    await _initialize();
    return await _client.delete(
      Uri.parse(url),
      headers: headers,
    );
  }



  Future<Response?> get({required String url}) async {
    await _initialize();
    return await _client.get(Uri.parse(url), headers: headers);
  }
}
