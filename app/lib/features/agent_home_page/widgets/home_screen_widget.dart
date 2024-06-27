import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/agent_home_page/view/profile_screen.dart';
import 'package:app/features/agent_home_page/view/settings_screen.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/view.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    BalancesScreen(), // Экран балансов
    VacanciesScreen(), // Экран вакансий
    SettingsScreen(title: 'Настройки'), // Экран настроек
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Цвет фона нижнего меню
        selectedItemColor: blue1, // Цвет выбранного элемента
        unselectedItemColor: darkgray, // Цвет не выбранных элементов
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Баланс',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Вакансии',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
