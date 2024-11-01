import 'package:app/features/agent_home_page/view/home_screen.dart';
import 'package:app/features/calendar/view/calendar.dart';
import 'package:app/features/distributor_pesonal_account/view/company_data.dart';
import 'package:app/features/distributor_pesonal_account/view/distributor_home_page.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:app/features/distributor_pesonal_account/view/requirments.dart';
import 'package:app/features/distributor_pesonal_account/view/settings_page.dart';
import 'package:app/features/onboarding/view.dart';
import 'package:app/features/onboarding/view/stub_screen.dart';
import 'package:app/features/support_chat/view/support_chat.dart';
import 'package:app/registration_auth/authorization.dart';
import 'package:app/registration_auth/registration_distributor.dart';
import 'package:app/registration_auth/registration_agent.dart';
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
        '/authorization': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
        '/stub': (context) => StubPage(),
        '/homedist': (context) => HomeScreenDist(),
        '/company': (context) => CompanyManagementPage(),
        '/req': (context) => CompanyRequirementsLE(),
        '/homepage': (context) => DistHomePage(),
        '/registration_agent': (context) => RegistrationPageAgent(),
        '/registration_distributor': (context) => RegistrationPage(),
        '/company_data': (context) => CompanyData(),
        '/support_chat': (context) => SupportChatScreen(),
        '/calendar': (context) => CustomCalendarScreen(),
      },
      initialRoute: '/',
    );
  }
}
