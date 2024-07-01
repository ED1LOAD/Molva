import 'dart:typed_data';

import 'vacancy.dart';
import 'package:flutter/material.dart';

class VacancyHeading extends StatelessWidget {
  const VacancyHeading({
    super.key,
    this.imageBytes,
    required this.vacancy,
  });

  final Uint8List? imageBytes;
  final Vacancy vacancy;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 5,
        right: 0,
      ),
      trailing:
          imageBytes == null ? SizedBox(height: 24) : Image.memory(imageBytes!),
      title: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            vacancy.company,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.0,
                ),
          )),
      subtitle: Text(
        vacancy.title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 19.0,
            ),
      ),
    );
  }
}
