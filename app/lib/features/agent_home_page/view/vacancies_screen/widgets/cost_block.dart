import 'package:flutter/material.dart';
import 'package:app/theme.dart';

class CostBlock extends StatelessWidget {
  final String text;
  final String subtext;
  final TextStyle? subtextStyle;

  const CostBlock({
    super.key,
    required this.text,
    required this.subtext,
    this.subtextStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        );
    if (subtextStyle != null) {
      style = subtextStyle!;
    }
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                subtext,
                style: style,
              ),
            ],
          )),
    );
  }
}
