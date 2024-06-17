import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class AccessController{
  static final AccessController instance = AccessController();
  static const _baseUrl = 'https://fakestoreapi.com/auth/login';

  Future<bool> loginApi(String username, String password) async {
    http.Response response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'username': username,
        'password': password
      })
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  bool login(String username, String password){
    if(username == 'admin' && password == 'master') {
      return true;
    } else {
      return false;
    }
  }
}