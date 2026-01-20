import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/request_model.dart';

class RequestsService {
  static const String baseUrl = 'http://10.0.2.2/api';

  Future<List<RequestModel>> getRequests() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    final response = await http.get(
      Uri.parse('$baseUrl/requests'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => RequestModel.fromJson(item)).toList();
      
    } else {
      throw Exception('Failed to load requests');
    }
  }

  Future<RequestModel> createRequest(String title, String description) async {
    final token = await getToken();

    final response = await http.post(
      Uri.parse('$baseUrl/requests'),
      headers: {
        'Authorization' : 'Bearer $token',
        'Content-Type' : 'application/json',
      },
      body: jsonEncode({
        'title' : title,
        'description' : description,
      }),
    );

    return response.statusCode == 201;
  }
}