import 'package:app/features/distributor_pesonal_account/view/requirments.dart';
import 'package:flutter/material.dart';

class RequirButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RequirButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color(0xFF0C0C0C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SupportButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color(0xFF888888),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class CompanyManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF), // Задний фон приложения
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // Высота AppBar
        child: AppBar(
          toolbarHeight: 70, // Высота AppBar
          backgroundColor: Color(0xFFF5F5F7), // Цвет фона AppBar
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Center(
              child: Text(
                'Управление компанией',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold, // Жирный текст
                  color: Colors.black,
                  fontFamily: 'Graphik LCG',
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Чтобы пользоваться приложением завершите регистрацию',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold, // Жирный текст
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height:
                    1.2, // line-height: 16.8px corresponds to a multiplier of 1.2 for a font size of 14px
              ),
              decoration: InputDecoration(
                hintText: 'mail@mail.ru',
                fillColor: Color(0xFFF5F5F7),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0C0C0C),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'На указанный адрес было направлено письмо. Подтвердите почту, чтобы продолжить',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Данные при регистрации',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold, // Жирный текст
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              decoration: InputDecoration(
                hintText: 'Иванов Иван Иванович',
                fillColor: Color(0xFFF5F5F7),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0C0C0C),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              decoration: InputDecoration(
                hintText: 'mail@mail.ru',
                fillColor: Color(0xFFF5F5F7),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0C0C0C),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              decoration: InputDecoration(
                hintText: '+7-999-999-9999',
                fillColor: Color(0xFFF5F5F7),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0C0C0C),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
            ),
            SizedBox(height: 20),
            SupportButton(
                text: 'Реквизиты',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyRequirements(),
                      ));
                }),
            SizedBox(height: 20),
            SupportButton(text: 'Поддержка', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
