import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/agent_home_page/view/profile_screen.dart';
import 'package:app/features/agent_home_page/view/settings_screen.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ProfileScreen(), // Экран профиля (по умолчанию выбран)
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Цвет фона нижнего меню
        selectedItemColor: Colors.black, // Цвет выбранного элемента
        unselectedItemColor: Colors.red[400], // Цвет не выбранных элементов
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Балансы',
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
