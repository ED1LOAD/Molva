import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/distributor_pesonal_account/employees/employees.dart';
import 'package:app/features/distributor_pesonal_account/view/requirments.dart';
import 'package:app/features/distributor_pesonal_account/view/requirments_for_IP.dart';
import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Импортируйте страницу CompanyRequirements

class DistHomePage extends StatefulWidget {
  const DistHomePage({super.key});

  @override
  State<DistHomePage> createState() => DistHomePageState();
}

class DistHomePageState extends State<DistHomePage> {
  final bool _hasCompanyDataAccess = true;
  final bool _hasBankDataAccess = true;

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;
    return isMobileLayout ? _buildMobileLayout() : _buildWebLayout();
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 25,
        ),
        child: Column(
          children: [
            const WelcomeText(),
            const SizedBox(height: 20),
            if (_hasBankDataAccess) const BalanceCard(balance: '0'),
            const SizedBox(height: 20),
            OptionsGrid(
              hasCompanyDataAccess: _hasCompanyDataAccess,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Container(
          width: 1024,
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20.0,
                spreadRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: [
              const WelcomeText(),
              const SizedBox(height: 20),
              if (_hasBankDataAccess) const BalanceCard(balance: '0'),
              const SizedBox(height: 20),
              Expanded(
                  child: WebOptionsGrid(
                hasCompanyDataAccess: _hasCompanyDataAccess,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Приветствуем,',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Graphik LCG',
                height: 1.2),
          ),
          Text(
            'Иван Иванович',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Graphik LCG',
            ),
          ),
        ],
      ),
    );
  }
}

class BalanceCard extends BalanceBlock {
  const BalanceCard({super.key, required super.balance});

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
              ],
            ),
            IconButton(
              onPressed: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) => BalancesScreen()));
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsGrid extends StatelessWidget {
  final bool hasCompanyDataAccess;
  const OptionsGrid({super.key, required this.hasCompanyDataAccess});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: [
          if (hasCompanyDataAccess)
            OptionCard(
              svgIconPath: 'assets/icons/company_requirements.svg',
              label: 'Данные компании',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyRequirementsLE()),
                );
              },
            ),
          OptionCard(
            svgIconPath: 'assets/icons/employees.svg',
            label: 'Сотрудники',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EmployeeWidget()));
            },
          ),
          OptionCard(
            svgIconPath: 'assets/icons/notification.svg',
            label: 'Уведомления',
            onPressed: () {},
          ),
          OptionCard(
            svgIconPath: 'assets/icons/support_chat.svg',
            label: 'Поддержка',
            notificationCount: 1,
            onPressed: () {
              Navigator.pushNamed(context, '/support_chat');
            },
            isSupport: true,
          ),
        ],
      ),
    );
  }
}

class WebOptionsGrid extends StatelessWidget {
  final bool hasCompanyDataAccess;
  const WebOptionsGrid({super.key, required this.hasCompanyDataAccess});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1.5,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: [
        if (hasCompanyDataAccess)
          OptionCard(
            svgIconPath: 'assets/icons/company_requirements.svg',
            label: 'Данные компании',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompanyRequirementsLE()),
              );
            },
          ),
        OptionCard(
          svgIconPath: 'assets/icons/employees.svg',
          label: 'Сотрудники',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EmployeeWidget()),
            );
          },
        ),
        OptionCard(
          svgIconPath: 'assets/icons/notification.svg',
          label: 'Уведомления',
          onPressed: () {},
        ),
        OptionCard(
          svgIconPath: 'assets/icons/support_chat.svg',
          label: 'Поддержка',
          notificationCount: 1,
          onPressed: () {
            // Navigator.pushNamed(context, '/support_chat');
          },
          isSupport: true,
        ),
      ],
    );
  }
}

class OptionCard extends StatelessWidget {
  final String svgIconPath;
  final String label;
  final int? notificationCount;
  final VoidCallback onPressed;
  final bool isSupport;

  const OptionCard({
    super.key,
    required this.svgIconPath,
    required this.label,
    this.notificationCount,
    required this.onPressed,
    this.isSupport = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isSupport ? Colors.grey[600] : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color:
                isSupport ? Colors.white : Colors.grey.shade300, // Цвет границы
            width: 1, // Толщина границы
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: SvgPicture.asset(
                  svgIconPath,
                  width: 24,
                  height: 24,
                  color: isSupport ? Colors.white : Colors.blue,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isSupport ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              if (notificationCount != null && notificationCount! > 0)
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    child: Text(
                      '$notificationCount',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
