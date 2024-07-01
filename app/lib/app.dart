import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/authorization/view.dart';
import 'package:app/features/distributor%20pesonal%20account/main_page.dart';
import 'package:app/features/distributor%20pesonal%20account/requirments.dart';
import 'package:app/features/distributor%20pesonal%20account/settings_page.dart';
import 'package:app/features/login/view.dart';
import 'package:app/features/onboarding/view.dart';
import 'package:app/features/onboarding/widgets/onboarding_page.dart';
import 'package:app/registration/registration.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Molva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: customTheme,
      ),
      routes: {
        '/': (context) => OnboardingScreen(),
        '/toregistration': (context) => ToRegistration(),
        '/login': (context) => LoginScreen(),
        '/authorization': (context) => AuthorizationScreen(),
        '/home': (context) => HomeScreen(),
        '/company': (context) => CompanyManagementPage(),
        '/req': (context) => CompanyRequirements(),
        '/homepage': (context) =>  DistHomePage(),
      },
      initialRoute: '/',
    );
  }
}
