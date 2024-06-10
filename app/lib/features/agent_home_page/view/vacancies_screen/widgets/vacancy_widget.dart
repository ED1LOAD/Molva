import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'vacancy.dart';
import 'vacancy_page.dart';
import 'vacancy_heading.dart';
import 'vacancy_cost.dart';
import 'vacancy_date_and_copy.dart';

class VacancyWidget extends StatelessWidget {
  const VacancyWidget({
    super.key,
    required this.vacancy,
    required this.imageBytes,
  });

  final Vacancy vacancy;
  final Uint8List imageBytes;
  static const double _padding = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VacancyPage(vacancy)),
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
                    height: 165.0,
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
                          ]),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
