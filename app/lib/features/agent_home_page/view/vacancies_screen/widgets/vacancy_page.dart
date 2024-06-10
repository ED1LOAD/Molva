import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'vacancy.dart';

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;
  const VacancyPage(this.vacancy, {super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  int _jobVacancyId = 1448;
  String _fio = 'AlexanderAlexander';
  String _baseUrl = 'https://somesite.com/survey';
  void SetJobVacancyId(int id) {
    _jobVacancyId = id;
  }

  String uniqueLink = '';
  Future<String> _getSurveyLink() async {
    String fioHash = _generateHash(_fio);
    String surveyUrl = '$_baseUrl?job_id=$_jobVacancyId&fio_hash=$fioHash';
    print(surveyUrl);
    return surveyUrl;
  }

  String _generateHash(String input) {
    var bytes = utf8.encode(input); // Конвертация в UTF-8 для безопасности
    var digest = sha256.convert(bytes); // Используем SHA-256 для хэширования
    return digest.toString();
  }

  void _generateUniqueLink() {
    _getSurveyLink().then((link) {
      setState(() {
        uniqueLink = link;
      });
    });
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ссылка скопирована в буфер обмена')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Вакансия",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.vacancy.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10.0),
            Text(
              widget.vacancy.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Требуемый опыт работы: не требуется\nЧастичная занятость, гибкий график\nВозможно временное оформление: договор услуг, подряда, ГПХ, самозанятые, ИП",
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                _generateUniqueLink();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Ссылка"),
                      content: Text(uniqueLink),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Закрыть"),
                        ),
                        TextButton(
                          onPressed: () {
                            _copyToClipboard(uniqueLink);
                          },
                          child: const Text("Копировать ссылку"),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Получить ссылку",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
