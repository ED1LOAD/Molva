import 'package:flutter/material.dart';

import 'cost_block.dart';
import 'vacancy.dart';

class VacancyCost extends StatelessWidget {
  const VacancyCost({
    super.key,
    required this.vacancy,
  });

  final Vacancy vacancy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 5,
          child: CostBlock(
            text: "Вознаграждение:",
            subtext: "50%",
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 5,
          child: CostBlock(
            text: "ЗП кандидата:",
            subtext: "${vacancy.cost} ₽",
          ),
        ),
      ],
    );
  }
}
