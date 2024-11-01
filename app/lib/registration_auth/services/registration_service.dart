import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationService {
  // Метод для регистрации пользователя
  Future<void> registerUser(String surname, String name, String patronymic,
      String password, String email, String phone, int userType) async {
    final url = Uri.parse('http://app-molva.ru/api/v1/register');
    print('Sending registration request to: $url');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'surname': surname,
        'name': name,
        'patronymic': patronymic,
        'password': password,
        'email': email,
        "phone": phone,
        "user_type": userType,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200 && response.statusCode != 201) {
      final data = response.body.isNotEmpty ? json.decode(response.body) : {};
      throw Exception(data['message'] ?? 'Failed to register');
    } else {
      print('User registration successful');
    }
  }

  Future<int> loginUser(String email, String password) async {
    final url = Uri.parse('http://app-molva.ru/api/v1/login');
    print('Sending login request to: $url');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      int userType = int.parse(data['user_type'].toString());

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', data['access_token']);
      await prefs.setString('refresh_token', data['refresh_token']);
      await prefs.setString('user_type', userType.toString());

      return userType;
    } else {
      final data = response.body.isNotEmpty ? json.decode(response.body) : {};
      throw Exception(data['message'] ?? 'Failed to login');
    }
  }

  Future<void> registerAndLogin(String surname, String name, String patronymic,
      String password, String email, String phone, int userType) async {
    await registerUser(
        surname, name, patronymic, password, email, phone, userType);
    await loginUser(email, password);
  }
}
