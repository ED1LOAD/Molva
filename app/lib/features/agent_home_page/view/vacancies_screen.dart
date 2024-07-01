import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/features/agent_home_page/widgets/resposes_page.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class VacanciesScreen extends StatefulWidget {
  const VacanciesScreen({super.key});

  @override
  State<VacanciesScreen> createState() => _VacanciesScreenState();
}

class _VacanciesScreenState extends State<VacanciesScreen> {
  final storage = FlutterSecureStorage();
  final List<Vacancy> vacancies = [
    // Vacancy(
    //     title: 'Вечерний консультант в Тинькофф Банке (удалённо)',
    //     description: 'от 35 000 ₽',
    //     picture: "assets/tink.png"),
    // Vacancy(
    //     title: 'Финансовый аналитик в Финтех',
    //     description: 'от 100 000 ₽',
    //     picture: "assets/yandex.png"),
  ];

  int page = 1;
  bool isLoading = false;
  ScrollController _scrollController = ScrollController();
  final String access_token = "aaa";
  final String agent_id = "aaa";

  @override
  void initState() {
    _readData();
    super.initState();
    _scrollController.addListener(_scrollListener);
    _fetchVacancies();
  }

  void _readData() async {
    // access_token = await storage.read(key: 'access_token');
    // agent_id = await storage.read(key: 'agent_id');
    // access_token = "aaaaa";
    // agent_id = "12345";
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchVacancies();
    }
  }

  List<Vacancy> _getVacancies(String body) {
    // print(body);
    final decodedBody = jsonDecode(body) as List<dynamic>;
    final result = decodedBody
        .map((vacancyJson) => Vacancy.fromJson(vacancyJson))
        .toList();
    print(result);
    return result;
  }

  Future<void> _fetchVacancies() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse(
          '$domain/vacancies?agent_id=$agent_id&access_token=$access_token&amount=10'));
      if (response.statusCode == 200) {
        final newVacancies = _getVacancies(response.body);
        setState(() {
          vacancies.addAll(newVacancies);
          page++;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch vacancies');
      }
    } catch (error) {
      print(error);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вакансии'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100.0),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResponsePage()),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: vacancies.length + 1,
        itemBuilder: (context, index) {
          if (index == vacancies.length) {
            return isLoading ? CircularProgressIndicator() : Container();
          }
          final vacancy = vacancies[index];
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VacancyPage(vacancy)),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 175.0,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  trailing: Image.asset(vacancy.picture),
                                  title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(vacancy.title)),
                                  subtitle: Text(vacancy.description),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, bottom: 8.0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    color: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      "Получить ссылку",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
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
        },
      ),
    );
  }
}

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;
  VacancyPage(this.vacancy);

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  int _jobVacancyId = 1448;
  String _fio = 'AdolfHitler';
  String _baseUrl = 'https://natehiggers.com/survey';
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
        title: const Text("Вакансия"),
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

class Vacancy {
  final int id;
  final String title;
  final String description;
  final String picture;

  Vacancy(
      {required this.id,
      required this.title,
      required this.description,
      required this.picture});

  factory Vacancy.fromJson(Map<String, dynamic> json) {
    return Vacancy(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['requirements'] as String,
      picture: json['logo'] as String,
    );
  }
}
