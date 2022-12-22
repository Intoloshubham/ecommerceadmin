import 'dart:convert';
import 'dart:io';

import 'package:ecommerceadmin/model/index.dart';
import 'package:http/http.dart' as http;

class APICall {
  Future<http.Response> teamRegister() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(
        Uri.parse('http://192.168.0.117:4000/api/team-register'),
        headers: headers);
  }

  Future<http.Response> teamLogin(TeamLoginModel body) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.post(
        Uri.parse('http://192.168.0.117:4000/api/team-login'),
        headers: headers,
        body: jsonEncode(body));
  }
}
