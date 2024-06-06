import 'package:flutter/material.dart';

class MegaPhone extends StatelessWidget {
  const MegaPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/onboarding/megaphone.png',
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Исследуйте новый канал привлечения сотрудников',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text('Размещайте вакансию или привлекайте кандидатов',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/onboarding/settings.png',
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Рекомендации по кандидатам и флоу',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text('Ведения теперь в одном месте',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Contract extends StatelessWidget {
  const Contract({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(
            'assets/onboarding/contract.png',
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Вакансия', style: Theme.of(context).textTheme.bodyLarge),
                Text('Рекомендация',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text('Трудоустройство',
                    style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
