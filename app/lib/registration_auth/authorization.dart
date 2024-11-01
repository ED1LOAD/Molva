import 'dart:convert';
import 'package:app/registration_auth/services/registration_service.dart';
import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final RegistrationService _registrationService = RegistrationService();
  bool isHovered = false;

  Future<void> _login(BuildContext context) async {
    try {
      int userType = await _registrationService.loginUser(
        _emailController.text,
        _passwordController.text,
      );
      if (userType == 0) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (route) => false);
      } else if (userType == 1) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/homedist', (route) => false);
      }
    } catch (e) {
      print('Error during login: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка входа: ${e.toString()}')),
      );
    }
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
      backgroundColor: const Color(0xFFF5F5F7),
      body: Stack(
        children: [
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
                      'Вход',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildFormField('Почта',
                              controller: _emailController, isWeb: false),
                          const SizedBox(height: 10),
                          _buildFormField('Пароль',
                              controller: _passwordController,
                              obscureText: true,
                              isWeb: false),
                          const SizedBox(height: 10),
                        ],
                      ),
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
                            if (_formKey.currentState?.validate() ?? false) {
                              _login(context);
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
                            'Войти',
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
                            Navigator.of(context).pushNamed('/toregistration');
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Регистрация',
                            style: TextStyle(
                                color: isHovered ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ),
        ],
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
            Navigator.of(context).pushNamed('/');
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
                      height: MediaQuery.of(context).size.height * 0.3,
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
                            'Вход',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          _buildFormField('Почта',
                              controller: _emailController, isWeb: true),
                          const SizedBox(height: 10),
                          _buildFormField('Пароль',
                              controller: _passwordController,
                              obscureText: true,
                              isWeb: true),
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
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    _login(context);
                                  }
                                },
                                child: const Text(
                                  'Войти',
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
                                      .pushNamed('/toregistration');
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 9, horizontal: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Регистрация',
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
    );
  }
}
