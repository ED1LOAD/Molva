import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Личный кабинет'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Добро пожаловать в ваш личный кабинет!',
              style: TextStyle(fontSize: 18.0),
            ),
            // Дополнительные виджеты профиля здесь
          ],
        ),
      ),
    );
  }
}
