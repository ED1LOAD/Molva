import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SaveButton({
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
          gradient: gradient,
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

class BankButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BankButton({
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
          color: Color(0xFFF0C0C0C),
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

class CompanyRequirements extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFFF5F5F7),
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Center(
              child: Text(
                'Реквизиты',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
              'Заполните данные',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              decoration: InputDecoration(
                hintText: 'Название Юр.лица',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
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
                hintText: 'ИНН/ОГРН',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              decoration: InputDecoration(
                hintText: 'Юр. адрес',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 10),
            BankButton(
              onPressed: () {},
              text: 'Банковские реквизиты',
            ),
            const Spacer(),
            SaveButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DistHomePage()),
                );
              },
              text: 'Сохранить',
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
