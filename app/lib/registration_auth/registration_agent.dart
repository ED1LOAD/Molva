import 'dart:convert';

import 'package:app/registration_auth/services/registration_service.dart';
import 'package:app/theme.dart';
import 'package:flutter/foundation.dart'; // Для использования kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPageAgent extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPageAgent> {
  bool isPerson = false;
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isHovered = false;

  static const int userType = 0;

  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final RegistrationService _registrationService = RegistrationService();

  Future<void> _registerAndLogin(BuildContext context) async {
    try {
      final requestBody = {
        'surname': _surnameController.text,
        'name': _nameController.text,
        'patronymic': _patronymicController.text,
        'password': _passwordController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'user_type': userType,
      };

      print('Request body: ${json.encode(requestBody)}');

      await _registrationService.registerAndLogin(
          _surnameController.text,
          _nameController.text,
          _patronymicController.text,
          _passwordController.text,
          _emailController.text,
          _phoneController.text,
          userType);
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } catch (e) {
      print('Error during registration or login: $e');
    }
    // Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;
    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/toregistration');
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: gradient),
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Transform.scale(
                  scale: 0.8,
                  child: SvgPicture.asset(
                    'assets/icons/logo.svg',
                    height: MediaQuery.of(context).size.height * 0.1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 206.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Я представляю кадровое агентство и ищу кандидатов в другие компании',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildFormField('Фамилия',
                                controller: _surnameController, isWeb: false),
                            const SizedBox(height: 10),
                            _buildFormField('Имя',
                                controller: _nameController, isWeb: false),
                            const SizedBox(height: 10),
                            _buildFormField('Отчество',
                                controller: _patronymicController,
                                isWeb: false),
                            const SizedBox(height: 10),
                            _buildFormField('Эл. почта',
                                controller: _emailController, isWeb: false),
                            const SizedBox(height: 10),
                            _buildFormField('Телефон',
                                controller: _phoneController, isWeb: false),
                            const SizedBox(height: 10),
                            _buildFormField('Пароль',
                                controller: _passwordController,
                                obscureText: true,
                                isWeb: false),
                            const SizedBox(height: 10),
                            _buildFormField('Повторите пароль',
                                controller: _confirmPasswordController,
                                obscureText: true,
                                isWeb: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buildChoiceButton('Юр. лицо', !isPerson, false),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _buildCheckbox(),
                          const SizedBox(width: 10.0),
                          const Expanded(
                            child: Text(
                              'Я прочитал и согласен с условиями Пользовательского соглашения',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF07B7F8), Color(0xFF0582EE)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (!isChecked) {
                                // Show a message if the checkbox is not selected
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Пожалуйста, примите условия Пользовательского соглашения'),
                                  ),
                                );
                                return;
                              }

                              if (_formKey.currentState?.validate() ?? false) {
                                if (_passwordController.text.trim() ==
                                    _confirmPasswordController.text.trim()) {
                                  _registerAndLogin(context);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Пароли не совпадают'),
                                    ),
                                  );
                                }
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 9, horizontal: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Регистрация',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      MouseRegion(
                        onEnter: (_) => setState(() => isHovered = true),
                        onExit: (_) => setState(() => isHovered = false),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 0),
                          width: double.infinity,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            gradient: isHovered
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF07B7F8),
                                      Color(0xFF0582EE)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )
                                : null,
                            border: Border.all(color: const Color(0xFF07B7F8)),
                            color: isHovered ? null : Colors.white,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/authorization');
                            },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 9, horizontal: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              'Войти',
                              style: TextStyle(
                                  color:
                                      isHovered ? Colors.white : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/toregistration');
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: gradient),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Transform.scale(
                    scale: 1.0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Регистрация',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Я представляю кадровое агентство и ищу кандидатов в другие компании',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                          _buildFormField('Фамилия',
                              controller: _surnameController, isWeb: false),
                          const SizedBox(height: 10),
                          _buildFormField('Имя',
                              controller: _nameController, isWeb: false),
                          const SizedBox(height: 10),
                          _buildFormField('Отчество',
                              controller: _patronymicController, isWeb: false),
                          const SizedBox(height: 10),
                          _buildFormField('Эл. почта',
                              controller: _emailController, isWeb: true),
                          const SizedBox(height: 10),
                          _buildFormField('Телефон',
                              controller: _phoneController, isWeb: true),
                          const SizedBox(height: 10),
                          _buildFormField('Пароль',
                              controller: _passwordController,
                              obscureText: true,
                              isWeb: true),
                          const SizedBox(height: 10),
                          _buildFormField('Повторите пароль',
                              controller: _confirmPasswordController,
                              obscureText: true,
                              isWeb: true),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              _buildChoiceButton('Юр. лицо', !isPerson, false),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              _buildCheckbox(),
                              const SizedBox(width: 10.0),
                              const Expanded(
                                child: Text(
                                  'Я прочитал и согласен с условиями Пользовательского соглашения',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF07B7F8),
                                    Color(0xFF0582EE)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  if (!isChecked) {
                                    // Show a message if the checkbox is not selected
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Пожалуйста, примите условия Пользовательского соглашения'),
                                      ),
                                    );
                                    return;
                                  }

                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    if (_passwordController.text.trim() ==
                                        _confirmPasswordController.text
                                            .trim()) {
                                      _registerAndLogin(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Пароли не совпадают'),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: const Text(
                                  'Регистрация',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          MouseRegion(
                            onEnter: (_) => setState(() => isHovered = true),
                            onExit: (_) => setState(() => isHovered = false),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 0),
                              width: double.infinity,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                gradient: isHovered
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFF07B7F8),
                                          Color(0xFF0582EE)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : null,
                                border:
                                    Border.all(color: const Color(0xFF07B7F8)),
                                color: isHovered ? null : Colors.white,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/authorization');
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Войти',
                                  style: TextStyle(
                                      color: isHovered
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String labelText,
      {required TextEditingController controller,
      bool obscureText = false,
      required bool isWeb}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: isWeb ? 14 : 12,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      obscureText: obscureText,
      style: TextStyle(
        fontSize: isWeb ? 14 : 12,
        fontWeight: FontWeight.normal,
      ),
      validator: (value) {
        if (labelText == 'Фамилия') {
          return _validateSurname(value ?? '');
        } else if (labelText == 'Имя') {
          return _validateName(value ?? '');
        } else if (labelText == 'Отчество') {
          return _validatePatronymic(value ?? '');
        } else if (labelText == 'Эл. почта') {
          return _validateEmail(value ?? '');
        } else if (labelText == 'Телефон') {
          return _validatePhone(value ?? '');
        } else if (labelText == 'Пароль') {
          return _validatePassword(value ?? '');
        } else if (labelText == 'Повторите пароль') {
          return _validateConfirmPassword(value ?? '');
        }
        return null;
      },
    );
  }

  Widget _buildChoiceButton(String text, bool isSelected, bool isPerson) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            this.isPerson = isPerson;
          });
        },
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F7),
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
              color: isSelected ? const Color(0xFF0582EE) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Radio<bool>(
                value: isPerson,
                groupValue: this.isPerson,
                onChanged: (bool? value) {
                  setState(() {
                    this.isPerson = value ?? true;
                  });
                },
                activeColor: const Color(0xFF0582EE),
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isChecked ? const Color(0xFF0582EE) : const Color(0xFFF5F5F7),
          border: isChecked ? null : Border.all(color: Colors.grey),
        ),
        child: isChecked
            ? const Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }

  String? _validateSurname(String value) {
    final regex = RegExp(r'^[А-яЁё][А-яЁё’\- ]*$');

    if (value.isEmpty) {
      return "Обязательное поле";
    } else if (value.length > 32) {
      return "Не более 32 символов";
    } else if (!regex.hasMatch(value)) {
      return "Только русские буквы, первая буква с большой";
    } else if (value[0] != value[0].toUpperCase()) {
      return "Первая буква должна быть заглавной";
    }
    return null;
  }

  String? _validateName(String value) {
    final regex = RegExp(r'^[А-яЁё][А-яЁё’\- ]*$');

    if (value.isEmpty) {
      return "Обязательное поле";
    } else if (value.length > 32) {
      return "Не более 32 символов";
    } else if (!regex.hasMatch(value)) {
      return "Только русские буквы, первая буква с большой";
    } else if (value[0] != value[0].toUpperCase()) {
      return "Первая буква должна быть заглавной";
    }
    return null;
  }

  String? _validatePatronymic(String value) {
    final regex = RegExp(r'^[А-яЁё][А-яЁё’\- ]*$');

    if (value.isNotEmpty) {
      if (value.length > 32) {
        return "Не более 32 символов";
      } else if (!regex.hasMatch(value)) {
        return "Только русские буквы, первая буква с большой";
      } else if (value[0] != value[0].toUpperCase()) {
        return "Первая буква должна быть заглавной";
      }
    }
    return null;
  }

  String? _validateEmail(String value) {
    final regex = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

    if (value.isEmpty) {
      return "Обязательное поле";
    } else if (!regex.hasMatch(value)) {
      return "Пожалуйста, введите корректный email-адрес";
    }
    return null;
  }

  String? _validatePhone(String value) {
    final phoneNumber = value.replaceFirst('+7', '').trim();

    if (phoneNumber.isEmpty) {
      return "Обязательное поле";
    }

    final regex = RegExp(r'^\d{10}$');
    if (!regex.hasMatch(phoneNumber)) {
      return "Пожалуйста, введите корректный номер телефона (10 цифр)";
    }

    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return "Обязательное поле";
    }

    if (value.length < 8 || value.length > 16) {
      return "Длина пароля должна быть от 8 до 16 символов";
    }

    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));

    if (!hasUppercase || !hasLowercase || !hasDigit) {
      return "Пароль должен включать одну заглавную букву, одну строчную букву и одну цифру";
    }

    return null;
  }

  String? _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Обязательное поле";
    }

    if (value != _passwordController.text) {
      return "Пароли не совпадают";
    }

    return null;
  }
}
