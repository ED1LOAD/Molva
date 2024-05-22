import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String button;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.button,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        if (description != '') const SizedBox(height: 16),
        if (description != '')
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        if (button != '') const SizedBox(height: 16),
        if (button != '')
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/authorization', (route) => false);
            },
            child: Text(
              button,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
      ],
    );
  }
}

class OboardContent {
  final String title;
  final String description;
  final String button;
  OboardContent({
    required this.title,
    required this.description,
    required this.button,
  });
}
