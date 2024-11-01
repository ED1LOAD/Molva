import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StubPage extends StatelessWidget {
  const StubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: pageBody(context),
          ),
          SizedBox(height: MediaQuery.of(context).size.width >= 800 ? 20 : 30),
          buttonSection(context),
          SizedBox(height: MediaQuery.of(context).size.width >= 800 ? 20 : 120),
        ],
      ),
    );
  }

  Widget pageBody(BuildContext context) {
    return PageView(
      children: [
        _buildContent(context),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final bool isWebLayout = MediaQuery.of(context).size.width >= 800;
    return isWebLayout ? _buildWebLayout(context) : _buildMobileLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.3,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding/img_5.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Спасибо!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(height: 15), // Adjusted spacing
              Text(
                'Мы свяжемся с Вами в ближайшее время',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Спасибо!',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black, fontSize: 40),
                ),
                const SizedBox(height: 20),
                Text(
                  'Мы свяжемся с Вами в ближайшее время',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding/img_5.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonSection(BuildContext context) {
    final bool isWebLayout = MediaQuery.of(context).size.width >= 800;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        direction: Axis.horizontal,
        children: [
          _buildButton('molva.io', _launchWebsite, isWebLayout),
          _buildButton('info@molva.io', _launchEmail, isWebLayout),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, bool isWebLayout) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: isWebLayout ? 52 : 36,
        width: isWebLayout ? 320 : 160,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 169, 169, 169),
              Color.fromARGB(255, 116, 116, 116)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Future<void> _launchWebsite() async {
    const url = 'https://molva.io/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'info@molva.io',
      query: 'subject=Запрос&body=Здравствуйте!',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email';
    }
  }
}
