import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';

class LinkGenerator {
  LinkGenerator();
  final int _jobVacancyId = 1;

  final String _fio = 'AlexanderAlexander';
  final String _baseUrl = 'https://somesite.com/survey';

  bool isShowingSnackBar = false;

  String uniqueLink = '';
  Future<String> _getSurveyLink() async {
    String fioHash = _generateHash(_fio);
    String surveyUrl = '$_baseUrl?job_id=$_jobVacancyId&fio_hash=$fioHash';
    return surveyUrl;
  }

  String _generateHash(String input) {
    var bytes = utf8.encode(input); // Конвертация в UTF-8 для безопасности
    var digest = sha256.convert(bytes); // Используем SHA-256 для хэширования
    return digest.toString();
  }

  void _generateUniqueLink() {
    _getSurveyLink().then((link) {
      uniqueLink = link;
    });
  }

  void CopyToClipboard(BuildContext context) {
    if (!isShowingSnackBar) {
      _generateUniqueLink();
      isShowingSnackBar = true;
      Clipboard.setData(ClipboardData(text: uniqueLink)).then((_) {
        SmartSnackBars.showCustomSnackBar(
          context: context,
          duration: const Duration(seconds: 1),
          animateFrom: AnimateFrom.fromBottom,
          distanceToTravel: 50,
          child: Container(
            height: 81,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(37, 37, 37, 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Image.asset(
                "assets/vacancies/check.png",
                width: 25,
              ),
              title: Text(
                "Ваша личная ссылка скопирована.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              subtitle: Text(
                "Отправьте ее вашему кандидату",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
        );
      });
      Future.delayed(const Duration(seconds: 1)).then((_) {
        isShowingSnackBar = false;
      });
    }
  }
}
