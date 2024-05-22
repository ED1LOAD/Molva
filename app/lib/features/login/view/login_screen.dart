import 'package:app/constants.dart';
import 'package:app/features/login/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final width = 150.0;
 final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
 Future<String?> authenticate(String username, String password) async {
  final url = Uri.parse('$domain/login');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['access_token'];
  } else if (response.statusCode == 401) {
    throw Exception('Invalid credentials');
  } else {
    throw Exception('Failed to authenticate');
  }
}
  Future<void> _login(BuildContext context) async {
    try {
      final token = await authenticate(_emailController.text, _passwordController.text);
      if (token != null) {
        Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: LoginBody(
        width: width,
        emailController: _emailController,
        passwordController: _passwordController,
        onLoginPressed: () => _login(context),
      ),
    );
  }
}