import 'package:http/http.dart' as http;

class APICall {
  Future<http.Response> teamRegister() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(
        Uri.parse('http://192.168.0.117:4000/api/team-register'),
        headers: headers);
  }

  Future<http.Response> teamLogin(mobile, password) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(
        Uri.parse('http://192.168.0.117:4000/api/team-register'),
        headers: headers);
  }
}
