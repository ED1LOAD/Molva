import 'dart:typed_data';

import 'package:app/features/agent_home_page/view/vacancies_screen/view/vacancy_page.dart';
import 'package:flutter/material.dart';
import 'vacancy.dart';
import 'vacancy_heading.dart';
import 'vacancy_cost.dart';
import 'vacancy_date_and_copy.dart';

class VacancyWidget extends StatelessWidget {
  const VacancyWidget({
    super.key,
    required this.vacancy,
    this.imageBytes,
  });

  final Vacancy vacancy;
  final Uint8List? imageBytes;
  static const double _padding = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 3.0,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VacancyPage(
                          vacancy: vacancy,
                          imageBytes: imageBytes,
                        )),
              );
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 185.0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: _padding,
                        right: _padding,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VacancyHeading(
                              imageBytes: imageBytes,
                              vacancy: vacancy,
                            ),
                            VacancyCost(vacancy: vacancy),
                            const Spacer(),
                            VacancyDateAndCopy(vacancy: vacancy),
                            const SizedBox(
                              height: 15,
                            ),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
