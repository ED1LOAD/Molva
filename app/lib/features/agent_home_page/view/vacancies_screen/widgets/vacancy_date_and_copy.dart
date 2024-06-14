import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/view.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

import 'vacancy.dart';

class VacancyDateAndCopy extends StatelessWidget {
  final LinkGenerator linkGenerator = LinkGenerator();
  VacancyDateAndCopy({
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
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.0,
                ),
          ),
          const Spacer(),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  linkGenerator.CopyToClipboard(context);
                },
                color: Colors.white,
                icon: const Icon(Icons.copy),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
