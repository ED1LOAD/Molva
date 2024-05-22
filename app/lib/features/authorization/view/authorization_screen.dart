import 'dart:convert';
import 'dart:math';

import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  final storage = FlutterSecureStorage();
  String fullName = '';
  String email = '';
  String phone = '';
  String password = '';
  String userType = '';

  Future<http.Response>? _response;

  void _makeRequest() {
    var url = Uri.parse(domain);
    var body = {
      "fio": fullName,
      "email": email,
      "phone": phone,
      "password": password,
    };
    setState(() {
      _response = http.post(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );
    });
  }

  void _writeResponse() async {
    await storage.write(
        key: 'fio', value: fullName); // Никита: тут очень плохо с асинхронщиной Даниэль:похуй
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'phone', value: phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cоздание аккаунта'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'ФИО'),
              onChanged: (value) {
                setState(() {
                  fullName = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Почта'),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Телефон'),
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Пароль'),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            ListTile(
              title: Text('Юрлицо'),
              leading: Radio(
                value: 'Юрлицо',
                groupValue: userType,
                onChanged: (value) {
                  setState(() {
                    userType = value ?? '';
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Физлицо'),
              leading: Radio(
                value: 'Физлицо',
                groupValue: userType,
                onChanged: (value) {
                  setState(() {
                    userType = value ?? '';
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // fetchData();
                _makeRequest();
              },
              child: Text('Войти'),
            ),
            const SizedBox(height: 20),
            FutureBuilder<http.Response>(
              future: _response,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.data?.statusCode == 201) {
                  _writeResponse();
                  WidgetsBinding.instance.addPostFrameCallback((_) =>
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (route) => false));
                } else if (snapshot.data?.statusCode == 400) {
                  return const Text(
                    'Данный пользователь уже существует',
                    style: TextStyle(color: Colors.red),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const Text('');
              },
            ),
          ],
        ),
      ),
    );
  }
}
