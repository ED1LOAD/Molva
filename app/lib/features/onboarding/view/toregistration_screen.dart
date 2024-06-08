import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';
import 'package:flutter/widgets.dart';

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
      "Я представляю кадровое агентство и ищу кандидатов в другие компании";
  final String _companyText = "Я публикую вакансии для своей компании";

  String _currentOption = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: textBuilder(context),
            ),
            button(context),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  MaterialButton button(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Container(
          height: 36,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Далее",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textBuilder(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: _padding,
              right: _padding,
            ),
            child: Text(
              "Как вы будете использовать платформу?",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                  ),
            ),
          ),
          _buildRadioContainer(
            context,
            _agentText,
            _agent,
            (onChanged) {
              setState(() {
                _currentOption = onChanged.toString();
              });
            },
          ),
          _buildRadioContainer(
            context,
            _companyText,
            _company,
            (onChanged) {
              setState(() {
                _currentOption = onChanged.toString();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRadioContainer(BuildContext context, String label, String value,
      Function(dynamic) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: _padding,
        right: _padding,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: _currentOption == value ? blue1 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Radio(
              groupValue: _currentOption,
              activeColor: blue1,
              value: value,
              onChanged: onChanged,
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(_padding),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
