import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app/features/distributor_pesonal_account/employees/employees_role_settings.dart';
import 'package:app/features/distributor_pesonal_account/employees/widgets/employee.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';

class EmployeesAdd extends StatefulWidget {
  const EmployeesAdd({super.key});

  @override
  EmployeesAddState createState() => EmployeesAddState();
}

class EmployeesAddState extends State<EmployeesAdd> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  String role = "Полный доступ";
  final bool _hasEmployeeRoleAccess = true;

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(
          'Добавление сотрудника',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: background,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Заполните данные",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildCustomTextField(_nameController, 'ФИО'),
                    const SizedBox(height: 10),
                    _buildCustomTextField(_phoneController, 'Телефон'),
                    const SizedBox(height: 10),
                    _buildCustomTextField(_emailController, 'Эл. почта'),
                    const SizedBox(height: 10),
                    _buildCustomTextField(_dobController, 'Дата рождения'),
                    const SizedBox(height: 20),
                    const Text(
                      "Роль сотрудника",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: _buildCustomRoleRadio('Полный доступ')),
                        const SizedBox(width: 10),
                        Expanded(child: _buildCustomRoleRadio('Ограниченный')),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_hasEmployeeRoleAccess) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeesRoleSettings(
                          employeeName: _nameController.text,
                          employeeRole: role,
                        ),
                      ),
                    ).then((newEmployee) {
                      if (newEmployee != null && newEmployee is Employee) {
                        Navigator.pop(context, newEmployee);
                      }
                    });
                  } else {
                    final newEmployee = Employee(
                      name: _nameController.text,
                    );

                    _showSuccessSnackbar(context);

                    Navigator.pop(context, newEmployee);
                  }
                }
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
                  child: Text(
                    _hasEmployeeRoleAccess ? 'Далее' : 'Сохранить',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
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
              backgroundColor: background,
              title: const Text(
                'Добавление сотрудника',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
          padding: const EdgeInsets.all(15.0),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Заполните данные",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildCustomTextField(_nameController, 'ФИО'),
                        const SizedBox(height: 10),
                        _buildCustomTextField(_phoneController, 'Телефон'),
                        const SizedBox(height: 10),
                        _buildCustomTextField(_emailController, 'Эл. почта'),
                        const SizedBox(height: 10),
                        _buildCustomTextField(_dobController, 'Дата рождения'),
                        const SizedBox(height: 20),
                        const Text(
                          "Роль сотрудника",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: _buildCustomRoleRadio('Полный доступ')),
                            const SizedBox(width: 10),
                            Expanded(
                                child: _buildCustomRoleRadio('Ограниченный')),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_hasEmployeeRoleAccess) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeesRoleSettings(
                              employeeName: _nameController.text,
                              employeeRole: role,
                            ),
                          ),
                        ).then((newEmployee) {
                          if (newEmployee != null && newEmployee is Employee) {
                            Navigator.pop(context, newEmployee);
                          }
                        });
                      } else {
                        final newEmployee = Employee(
                          name: _nameController.text,
                        );

                        _showSuccessSnackbar(context);

                        Navigator.pop(context, newEmployee);
                      }
                    }
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
                      child: Text(
                        _hasEmployeeRoleAccess ? 'Далее' : 'Сохранить',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(TextEditingController controller, String label) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(11),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: const TextStyle(
            fontFamily: 'Graphik LCG',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF888888),
          ),
          border: InputBorder.none,
          isDense: true,
        ),
        style: const TextStyle(
          fontFamily: 'Graphik LCG',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF888888),
        ),
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Пожалуйста, введите $label';
        //   }
        //   return null;
        // },
      ),
    );
  }

  Widget _buildCustomRoleRadio(String roleValue) {
    bool isSelected = role == roleValue;

    return GestureDetector(
      onTap: () {
        setState(() {
          role = roleValue;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? const Color(0xFF0582EE) : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0582EE),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Text(
              roleValue,
              style: const TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF888888),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
