import 'package:flutter/material.dart';

import 'cost_block.dart';
import 'vacancy.dart';

class VacancyCost extends StatelessWidget {
  const VacancyCost({
    super.key,
    required this.vacancy,
    this.subtextStyle,
  });

  final Vacancy vacancy;
  final TextStyle? subtextStyle;

  @override
  Widget build(BuildContext context) {
    return BlocksWidget(
      text1: "Вознаграждение:",
      subtext1: "50%",
      text2: "ЗП кандидата:",
      subtext2: "${vacancy.cost} ₽",
      subtextStyle: subtextStyle,
    );
  }
}

class BlocksWidget extends StatelessWidget {
  const BlocksWidget({
    super.key,
    required this.text1,
    required this.subtext1,
    required this.text2,
    required this.subtext2,
    this.subtextStyle,
  });

  final String text1;
  final String subtext1;
  final String text2;
  final String subtext2;
  final TextStyle? subtextStyle;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: CostBlock(
              text: text1,
              subtext: subtext1,
              subtextStyle: subtextStyle,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 6,
            child: CostBlock(
              text: text2,
              subtext: subtext2,
              subtextStyle: subtextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
