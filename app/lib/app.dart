import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/authorization/view.dart';
import 'package:app/features/distributor_pesonal_account/view/company_data.dart';
import 'package:app/features/distributor_pesonal_account/view/distributor_home_page.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page_draft.dart';
import 'package:app/features/distributor_pesonal_account/view/requirments.dart';
import 'package:app/features/distributor_pesonal_account/view/settings_page.dart';
import 'package:app/features/login/view.dart';
import 'package:app/features/onboarding/view.dart';
import 'package:app/features/onboarding/widgets/onboarding_page.dart';
import 'package:app/registration/registration_agent.dart';
import 'package:app/registration/registration_distributor.dart';
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
        '/homedist': (context) => HomeScreenDist(),
        '/company': (context) => CompanyManagementPage(),
        '/req': (context) => CompanyRequirements(),
        '/homepage': (context) => DistHomePage(),
        '/registration_agent': (context) => RegistrationPage(),
        '/registration_distributor': (context) => RegistrationPageAgent(),
        '/company_data': (context) => CompanyData(),
      },
      initialRoute: '/',
    );
  }
}
