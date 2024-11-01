import 'package:flutter/material.dart';
import 'package:app/theme.dart';

class ToRegistration extends StatefulWidget {
  const ToRegistration({super.key});

  @override
  State<ToRegistration> createState() => _ToRegistrationState();
}

class _ToRegistrationState extends State<ToRegistration> {
  final String _agent = 'Агент';
  final String _company = 'Компания';
  static const double _padding = 15;

  final String _agentText =
      "Я хочу рекомендовать своих знакомых и зарабатывать";
  final String _companyText = "Я публикую вакансии для компании";

  String _currentOption = '';

  @override
  Widget build(BuildContext context) {
    final bool isWebLayout = MediaQuery.of(context).size.width >= 800;

    return isWebLayout ? _buildWebLayout(context) : _buildMobileLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: 1,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/onboarding/img_4.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOptions(context),
                  ],
                ),
              ),
            ),
            _buildNextButton(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildOptions(context)),
                _buildNextButton(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          _buildOptionCard(context, _agentText, _agent),
          _buildOptionCard(context, _companyText, _company),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        "Как вы будете использовать платформу?",
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 20),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => setState(() => _currentOption = value),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              color: _currentOption == value ? blue1 : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              _buildRadioButton(value),
              _buildOptionText(context, label),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButton(String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Radio<String>(
        groupValue: _currentOption,
        activeColor: blue1,
        value: value,
        onChanged: (selectedValue) =>
            setState(() => _currentOption = selectedValue!),
      ),
    );
  }

  Widget _buildOptionText(BuildContext context, String label) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(_padding),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_currentOption == _agent) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/registration_agent', (route) => false);
        } else if (_currentOption == _company) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/registration_distributor', (route) => false);
        }
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF07B7F8), Color(0xFF0582EE)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Далее",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
