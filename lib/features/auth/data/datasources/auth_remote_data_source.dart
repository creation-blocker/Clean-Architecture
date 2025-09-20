import 'dart:convert';

import 'package:chat_message/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<UserModel> register(String username, String password, String firstName, String lastName);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final client = http.Client();
  final baseUrl = 'https://dummyjson.com';

  @override
  Future<UserModel> login(String username, String password) async {
    final response = await client.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  @override
  Future<UserModel> register(String username, String password, String firstName, String lastName) async {
    final response = await client.post(
      Uri.parse('$baseUrl/users/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Register failed: ${response.body}');
    }
  }
}