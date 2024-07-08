import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 103,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 55),
            Text(
              'Приветствуем,',
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Colors.black,
              ),
            ),
            Text(
              'Иван Иванович',
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.2,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 330,
              height: 100,
              padding: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Баланс:',
                    style: TextStyle(
                      fontFamily: 'Graphik LCG',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: 'Graphik LCG',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '₽',
                        style: TextStyle(
                          fontFamily: 'Graphik LCG',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                CardButton(
                  title: 'Данные компании',
                  icon: Icons.info,
                ),
                CardButton(
                  title: 'Сотрудники',
                  icon: Icons.people,
                ),
                CardButton(
                  title: 'Уведомления',
                  icon: Icons.notifications,
                ),
                CardButton(
                  title: 'Поддержка',
                  icon: Icons.support,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavButton(
                title: 'Баланс',
                icon: Icons.account_balance_wallet,
                isActive: true,
              ),
              BottomNavButton(
                title: 'Вакансии',
                icon: Icons.work,
                isActive: false,
              ),
              BottomNavButton(
                title: 'Управление',
                icon: Icons.settings,
                isActive: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final String title;
  final IconData icon;

  CardButton({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 100,
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.blue,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Graphik LCG',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.2,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class BottomNavButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;

  BottomNavButton({
    required this.title,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 24,
          color: isActive ? Colors.blue : Colors.grey,
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Graphik LCG',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.2,
            color: isActive ? Colors.blue : Colors.grey,
          ),
        ),
      ],
    );
  }
}
