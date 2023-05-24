import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/animal_list.dart';

class ApiService {
  static const String _baseUrl = 'http://farmapp.channab.com:8000/';

  Future<String?> login(String mobileNumber, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/accounts/api/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mobile_number': mobileNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      String token = jsonResponse['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return null;
    } else if (response.statusCode == 401) {
      return 'Invalid credentials.';
    } else {
      return 'Failed to login. Status code: ${response.statusCode}';
    }
  }

  Future<HomeAPI> getHomeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is null');
    }

    final response = await http.get(
      Uri.parse('$_baseUrl/api/'),
      headers: <String, String>{
        'Authorization': 'Token $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      HomeAPI homeAPI = HomeAPI.fromJson(map);

      return homeAPI;
    } else {
      throw Exception('Failed to load home data');
    }
  }
}