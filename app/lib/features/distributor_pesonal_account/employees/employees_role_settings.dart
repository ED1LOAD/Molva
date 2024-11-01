import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app/features/distributor_pesonal_account/employees/widgets/employee.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart'; // Ensure you have the required package

class EmployeesRoleSettings extends StatefulWidget {
  final String employeeName;
  final String employeeRole;

  const EmployeesRoleSettings({
    super.key,
    required this.employeeName,
    required this.employeeRole,
  });

  @override
  EmployeesRoleSettingsState createState() => EmployeesRoleSettingsState();
}

class EmployeesRoleSettingsState extends State<EmployeesRoleSettings> {
  Map<String, String> selectedOptions = {
    'Управление компанией': 'Редактирование',
    'Создание сотрудников': 'Редактирование',
    'Роли и доступы': 'Редактирование',
    'Редактирование УЗ': 'Редактирование',
    'Балансы - просмотр': 'Редактирование',
    'Вакансии - просмотр вакансий': 'Просмотр',
  };

  void _showSuccessSnackbar(BuildContext context) {
    SmartSnackBars.showCustomSnackBar(
      context: context,
      duration: const Duration(milliseconds: 1500),
      animateFrom: AnimateFrom.fromBottom,
      distanceToTravel: 50,
      child: Container(
        height: 106,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(37, 37, 37, 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.green,
            child: Icon(Icons.check, color: Colors.white),
          ),
          title: Text(
            "Сотрудник добавлен",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            "Данные для авторизации вашего коллеги были направлены на указанную почту",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Настройка доступов',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Отметьте доступы для сотрудника ${widget.employeeName}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            _buildRoleSetting('Управление компанией',
                ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
            const SizedBox(height: 10),
            _buildRoleSetting('Создание сотрудников',
                ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
            const SizedBox(height: 10),
            _buildRoleSetting('Роли и доступы',
                ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
            const SizedBox(height: 10),
            _buildRoleSetting('Редактирование УЗ',
                ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
            const SizedBox(height: 10),
            _buildRoleSetting('Балансы - просмотр',
                ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
            const SizedBox(height: 10),
            _buildRoleSetting('Вакансии - просмотр вакансий',
                ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
            const SizedBox(height: 10),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final newEmployee = Employee(
                  name: widget.employeeName,
                );

                _showSuccessSnackbar(context);

                Navigator.pop(context, newEmployee);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            child: AppBar(
              title: const Text(
                'Настройка доступов',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              backgroundColor: background,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      "Отметьте доступы для сотрудника ${widget.employeeName}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildRoleSetting('Управление компанией',
                    ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
                const SizedBox(height: 10),
                _buildRoleSetting('Создание сотрудников',
                    ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
                const SizedBox(height: 10),
                _buildRoleSetting('Роли и доступы',
                    ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
                const SizedBox(height: 10),
                _buildRoleSetting('Редактирование УЗ',
                    ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
                const SizedBox(height: 10),
                _buildRoleSetting('Балансы - просмотр',
                    ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
                const SizedBox(height: 10),
                _buildRoleSetting('Вакансии - просмотр вакансий',
                    ['Просмотр', 'Редактирование', 'Не доступно к просмотру']),
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    final newEmployee = Employee(
                      name: widget.employeeName,
                    );

                    _showSuccessSnackbar(context);

                    Navigator.pop(context, newEmployee);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleSetting(String title, List<String> options) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: options.map((option) {
              bool isSelected = selectedOptions[title] == option;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptions[title] = option;
                    });
                  },
                  child: Container(
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            option == 'Просмотр'
                                ? Icons.visibility
                                : option == 'Редактирование'
                                    ? Icons.edit
                                    : Icons.block,
                            color: isSelected ? Colors.white : Colors.grey,
                            size: 24,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            option,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
