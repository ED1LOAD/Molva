import 'package:flutter/material.dart';


class DistHomePage extends StatefulWidget {
  @override
  State<DistHomePage> createState() => _DistHomePageState();
}

class _DistHomePageState extends State<DistHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Name'), // Replace with your app name
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              // Greeting Text
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 55.0, left: 15.0),
                child: Text(
                  "Приветствуем, Иван Иванович",
                  style: TextStyle(
                    fontFamily: 'Graphik LCG', // Assuming you have this font installed
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    height: 24.0 / 20.0, // Set line height based on font size
                  ),
                ),
              ),

              // Balance Section
              Row(
                children: <Widget>[
                  // Button
                  Container(
                    width: 330.0,
                    height: 100.0,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                      gradient: LinearGradient(
                        colors: [Color(0xFF07B7F8), Color(0xFF0582EE)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Баланс",
                          style: TextStyle(
                            fontFamily: 'Graphik LCG',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            height: 16.8 / 14.0,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "0 ₽",
                              style: TextStyle(
                                backgroundColor: Color(0xFFFFFFFF),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Company Data Section
              Row(
                children: <Widget>[
                  // Button
                  Container(
                    width: 160.0,
                    height: 100.0,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.business_center),
                        Text(
                          "Данные компании",
                          style: TextStyle(
                            fontFamily: 'Graphik LCG',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            height: 16.8 / 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // More buttons...
                  SizedBox(width: 10.0), // Add spacing between buttons
                  Container(
                    width: 160.0,
                    height: 100.0,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.notifications),
                        Text(
                          "Уведомления",
                          style: TextStyle(
                            fontFamily: 'Graphik LCG',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            height: 16.8 / 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Support Section
              Row(
                children: <Widget>[
                  // Support Button
                  Container(
                    width: 160.0,
                    height: 100.0,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.headset_mic), // Иконка для поддержки
                        SizedBox(height: 8), // Пространство между иконкой и текстом
                        Text(
                          "Поддержка", // Текст кнопки поддержки
                          style: TextStyle(
                            fontFamily: 'Graphik LCG',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            height: 16.8 / 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // More buttons...
                  SizedBox(width: 10.0), // Добавление промежутка между кнопками
                  Container(
                    width: 160.0,
                    height: 100.0,
                    padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings), // Иконка для другой кнопки
                        SizedBox(height: 8), // Пространство между иконкой и текстом
                        Text(
                          "Настройки", // Текст для другой кнопки
                          style: TextStyle(
                            fontFamily: 'Graphik LCG',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            height: 16.8 / 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
