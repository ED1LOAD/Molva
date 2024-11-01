import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/agent_home_page/view/profile_screen.dart';
import 'package:app/features/agent_home_page/view/settings_screen.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/view.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    BalancesScreen(), // Экран балансов
    VacanciesScreen(), // Экран вакансий
    DistHomePage(), // Экран настроек
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
        backgroundColor: Colors.white,
        selectedItemColor: blue1,
        unselectedItemColor: darkgray,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/balance.svg',
              width: 24.0,
              height: 24.0,
              color: darkgray,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/balance.svg',
              width: 24.0,
              height: 24.0,
              color: blue1,
            ),
            label: 'Баланс',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/vacancies.svg',
              width: 24.0,
              height: 24.0,
              color: darkgray,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/vacancies.svg',
              width: 24.0,
              height: 24.0,
              color: blue1,
            ),
            label: 'Вакансии',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 24.0,
              height: 24.0,
              color: darkgray,
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/settings.svg',
              width: 24.0,
              height: 24.0,
              color: blue1,
            ),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
