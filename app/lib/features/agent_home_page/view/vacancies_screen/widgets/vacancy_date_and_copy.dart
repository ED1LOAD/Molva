import 'package:app/theme.dart';
import 'package:flutter/material.dart';

import 'vacancy.dart';

class VacancyDateAndCopy extends StatelessWidget {
  const VacancyDateAndCopy({
    super.key,
    required this.vacancy,
  });

  final Vacancy vacancy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Container(
        color: Colors.white,
        child: Row(children: [
          Text(
            vacancy.date,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: const Icon(Icons.copy),
            ),
          ),
        ]),
      ),
    );
  }
}
