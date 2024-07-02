import 'dart:convert';
import 'dart:typed_data';

import 'package:app/constants.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/vacancy.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/vacancy_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:app/theme.dart';
import 'package:app/features/widgets/top_buttons.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';

class VacanciesScreenDistributor extends StatefulWidget {
  const VacanciesScreenDistributor({super.key});

  @override
  State<VacanciesScreenDistributor> createState() =>
      _VacanciesScreenDistributorState();
}

class _VacanciesScreenDistributorState
    extends State<VacanciesScreenDistributor> {
  final storage = FlutterSecureStorage();
  final List<Vacancy> vacancies = [
    Vacancy(
      id: 0,
      title: "Golang разработчик",
      company: "ИП ромашка",
      date: "15 мая",
      description: "",
      picture: "",
      cost: 60000,
      hasResponses: true,
    ),
    Vacancy(
      id: 1,
      title: "Кладовщик",
      company: "ИП ромашка",
      date: "15 мая",
      description: "",
      picture: "",
      cost: 30000,
      hasResponses: false,
    ),
    Vacancy(
      id: 2,
      title: "Менеджер по продажам",
      company: "ИП ромашка",
      date: "15 мая",
      description: "",
      picture: "",
      cost: 100000,
      hasResponses: false,
    ),
  ];

  int page = 1;
  bool isLoading = false;
  ScrollController _scrollControllerVacancies = ScrollController();
  ScrollController _scrollControllerResponse = ScrollController();
  final String access_token = "aaa";
  final String agent_id = "aaa";

  bool _isVacancies = true;
  bool _isResponds = false;
  bool _isDraft = false;
  bool _isArchive = false;

  @override
  void initState() {
    super.initState();
    // _scrollControllerVacancies.addListener(_scrollListener);
    // _fetchVacancies();
  }

  @override
  void dispose() {
    _scrollControllerVacancies.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollControllerVacancies.position.pixels ==
        _scrollControllerVacancies.position.maxScrollExtent) {
      // _fetchVacancies();
    }
  }

  List<Vacancy> _getVacancies(String body) {
    final decodedBody = jsonDecode(body) as List<dynamic>;
    final result = decodedBody
        .map((vacancyJson) => Vacancy.fromJson(vacancyJson))
        .toList();
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
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        clipBehavior: Clip.none,
        title: Text(
          'Вакансии',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.0,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.sort),
          color: darkgray,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: darkgray,
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: CircleAvatar(
        radius: 23,
        backgroundColor: blue2,
        child: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VacancyCreationPage(),
              ),
            )
          },
          icon: const Icon(Icons.add),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          _topButtons(),
          const SizedBox(height: 15),
          _isVacancies ? Flexible(child: _vacancyListBuilder()) : Container(),
        ],
      ),
      // body: _vacancyListBuilder(),
    );
  }

  ListView _vacancyListBuilder() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      // controller: _scrollControllerVacancies,
      itemCount: vacancies.length + 1,
      itemBuilder: (context, index) {
        if (index == vacancies.length) {
          return isLoading ? CircularProgressIndicator() : Container();
        }
        final vacancy = vacancies[index];
        Uint8List? imageBytes = base64Decode(vacancy.picture);
        if (vacancy.picture == "") {
          imageBytes = null;
        }
        return VacancyWidget(vacancy: vacancy, imageBytes: imageBytes);
      },
    );
  }

  ListView _respondsListBuilder() {
    List<Vacancy> vacanciesWithResposes = [];
    for (var i = 0; i < vacancies.length; i++) {
      if (vacancies[i].hasResponses) {
        vacanciesWithResposes.add(vacancies[i]);
      }
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      // controller: _scrollControllerResponse,
      itemCount: vacanciesWithResposes.length + 1,
      itemBuilder: (context, index) {
        if (index == vacanciesWithResposes.length) {
          return isLoading ? CircularProgressIndicator() : Container();
        }
        final vacancy = vacanciesWithResposes[index];
        var imageBytes = base64Decode(vacancy.picture);
        return VacancyWidget(vacancy: vacancy, imageBytes: imageBytes);
      },
    );
  }

  Padding _topButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            top: 5,
            bottom: 5,
            right: 5,
          ),
          child: Row(
            children: [
              Flexible(
                child: TopButton(
                  text: "Вакансии",
                  onPressedVacancies: () {
                    setState(() {
                      _isVacancies = true;
                      _isDraft = false;
                      _isArchive = false;
                    });
                  },
                  isVacancies: _isVacancies,
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TopButton(
                  text: "Черновик",
                  onPressedVacancies: () {
                    setState(() {
                      _isVacancies = false;
                      _isDraft = true;
                      _isArchive = false;
                    });
                  },
                  isVacancies: _isDraft,
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: TopButton(
                  text: "Вывод",
                  onPressedVacancies: () {
                    setState(() {
                      _isVacancies = false;
                      _isDraft = false;
                      _isArchive = true;
                    });
                  },
                  isVacancies: _isArchive,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VacancyCreationPage extends StatelessWidget {
  VacancyCreationPage({super.key});
  int id = 0;
  String title = "";
  String company = "";
  String date = "";
  String description = "";
  String picture = "";
  int cost = 0;
  bool hasResponses = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        clipBehavior: Clip.none,
        title: Text(
          'Публикация вакансии',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.0,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: darkgray,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 25,
            bottom: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldVacancy(
                  text: "Название вакансии",
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldVacancy(
                  text: "Адрес",
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldVacancy(
                  text: "Формат работы",
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldVacancy(
                  text: "Вознаграждение агента",
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldVacancy(
                  text: "Оплата",
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldVacancy(
                  text: "Требования",
                  onChanged: (value) {},
                  lines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldVacancy(
                  text: "Обязанности",
                  onChanged: (value) {},
                  lines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                NextButton(
                  text: "Продолжить",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PublicationNote()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
    ;
  }
}

class TextFieldVacancy extends StatelessWidget {
  const TextFieldVacancy({
    super.key,
    required this.text,
    required this.onChanged,
    this.lines,
  });
  final String text;
  final Function(String) onChanged;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        maxLines: lines,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: text,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: background,
          filled: true,
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}

class PublicationNote extends StatefulWidget {
  const PublicationNote({super.key});

  @override
  State<PublicationNote> createState() => _PublicationNoteState();
}

class _PublicationNoteState extends State<PublicationNote> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        clipBehavior: Clip.none,
        title: Text(
          'Публикация вакансии',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 16.0,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: darkgray,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 25,
            bottom: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Обратите внимание!",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                """Для публикации вакансии будет произведена заморозка средств, в размере суммы вознаграждения Агента и индивидуальной комиссии сервиса *сумма*. В любой моменты вы можете снять публикацию вакансии и вернуть средства.""",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      height: 19.6 / 15.0,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      activeColor: blue1,
                      splashRadius: 1,
                      value: _isAgreed,
                      onChanged: (value) {
                        setState(() {
                          _isAgreed = value!;
                        });
                      },
                    ),
                  ),
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Я прочитал и согласен с ",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    height: 19.6 / 15.0,
                                  ),
                        ),
                        TextSpan(
                          text: "условиями оферты",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 15.0,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400,
                                    height: 19.6 / 15.0,
                                    color: blue1,
                                  ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Spacer(),
              NextButton(
                text: "Продолжить",
                onPressed: () {
                  if (!_isAgreed) {
                    return;
                  }
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  _showDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    SmartSnackBars.showCustomSnackBar(
      context: context,
      duration: const Duration(milliseconds: 1500),
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
            "Вакансия отправлена на модерацию.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          subtitle: Text(
            "Через некоторое время она появится в списке ваших вакансий",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ),
    );
  }
}
