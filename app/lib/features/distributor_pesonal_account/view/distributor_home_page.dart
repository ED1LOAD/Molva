import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/agent_home_page/view/profile_screen.dart';
import 'package:app/features/agent_home_page/view/settings_screen.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/view.dart';
import 'package:app/features/distributor_home_page/view/balance_screen.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:app/features/distributor_pesonal_account/view/settings_page.dart';
import 'package:app/features/distributor_home_page/view/vacancies_screen.dart';
import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenDist extends StatefulWidget {
  const HomeScreenDist({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreenDist> {
  int _selectedIndex = 1;
  final bool _hasAccessToSettings = true;
  final bool _hasAccessToBank = true; // Флаг для проверки доступа

  static final List<Widget> _widgetOptions = <Widget>[
    BalancesScreenDistrtibutor(), // Экран балансов
    VacanciesScreenDistributor(), // Экран вакансий
    DistHomePage(), // Экран настроек
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout ? _buildMobileLayout() : _buildWebLayout();
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: background,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: blue1,
        unselectedItemColor: darkgray,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _buildBottomNavigationBarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    List<BottomNavigationBarItem> items = [];

    if (_hasAccessToBank) {
      items.add(
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
      );
    }

    items.add(
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
    );

    if (_hasAccessToSettings) {
      items.add(
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
      );
    }

    return items;
  }

  Widget _buildWebLayout() {
    return Scaffold(
      backgroundColor: background,
      body: Row(
        children: [
          _buildSideNavigationBar(),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildSideNavigationBar() {
    return Container(
      width: 250,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (_hasAccessToBank)
            _buildSideNavButton(
              icon: 'assets/icons/balance.svg',
              label: 'Баланс',
              index: 0,
            ),
          _buildSideNavButton(
            icon: 'assets/icons/vacancies.svg',
            label: 'Вакансии',
            index: 1,
          ),
          if (_hasAccessToSettings)
            _buildSideNavButton(
              icon: 'assets/icons/settings.svg',
              label: 'Настройки',
              index: 2,
            ),
        ],
      ),
    );
  }

  Widget _buildSideNavButton({
    required String icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        color: _selectedIndex == index ? blue1.withOpacity(0.1) : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 24.0,
              height: 24.0,
              color: _selectedIndex == index ? blue1 : darkgray,
            ),
            const SizedBox(width: 16.0),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: _selectedIndex == index ? blue1 : darkgray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
