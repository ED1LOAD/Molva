import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/distributor_home_page/view/vacancies_screen.dart';
import 'package:app/features/distributor_pesonal_account/employees/employees.dart';
import 'package:app/features/distributor_home_page/widget/home_screen_widget.dart';
import 'package:app/features/distributor_pesonal_account/view/settings_page.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class DistHomePage extends StatefulWidget {
  const DistHomePage({super.key});

  @override
  State<DistHomePage> createState() => _DistHomePageState();
}

class _DistHomePageState extends State<DistHomePage> {
  // int _selectedIndex = 1;
  // static final List<Widget> _widgetOptions = <Widget>[
  //   BalancesScreen(), // Экран балансов
  //   VacanciesScreenDistributor(), // Экран вакансий
  //   CompanyManagementPage(), // Экран настроек
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          children: [
            Text(
              'Приветствуем,',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Graphik LCG',
                  height: 1.2),
              textAlign: TextAlign.left,
            ),
            Text(
              'Иван Иванович',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Graphik LCG',
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 25,
        ),
        child: Column(
          children: [
            BalanceCard(balance: '0'),
            SizedBox(height: 20),
            OptionsGrid(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Цвет фона нижнего меню
        selectedItemColor: blue1, // Цвет выбранного элемента
        unselectedItemColor: darkgray, // Цвет не выбранных элементов
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

class BalanceCard extends BalanceBlock {
  const BalanceCard({required super.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
            ),
            Text(
              '$balance ₽',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
            ),
            /* IconButton(onPressed: (){
              //Navigator.push(context,MaterialPageRoute(builder: (context) => BalancesScreen()));

            }, icon:const Image(image:AssetImage('app/assets/balances/arrow.png')),
            ),*/
          ],
        ),
      ),
    );
  }
}

class OptionsGrid extends StatelessWidget {
  const OptionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          OptionCard(
            icon: Icons.info,
            label: 'Данные компании',
            onPressed: () {
              //
            },
          ),
          OptionCard(
            icon: Icons.people,
            label: 'Сотрудники',
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EmployeeWidget()));
            },
          ),
          OptionCard(
            icon: Icons.notifications,
            label: 'Уведомления',
            onPressed: () {
              // Надо сцепить с чем-то
            },
          ),
          OptionCard(
            icon: Icons.support,
            label: 'Поддержка',
            notificationCount: 1,
            onPressed: () {
              // Надо сцепить с чем-то
            },
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int? notificationCount;
  final VoidCallback onPressed;

  OptionCard({
    required this.icon,
    required this.label,
    this.notificationCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 10,
        width: 10,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Icon(icon, size: 30),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            if (notificationCount != null && notificationCount! > 0)
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$notificationCount',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
