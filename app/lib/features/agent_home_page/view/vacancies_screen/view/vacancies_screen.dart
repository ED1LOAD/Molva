import 'dart:convert';

import 'package:app/constants.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/view.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:app/theme.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/view.dart';

class VacanciesScreen extends StatefulWidget {
  const VacanciesScreen({super.key});

  @override
  State<VacanciesScreen> createState() => _VacanciesScreenState();
}

class _VacanciesScreenState extends State<VacanciesScreen> {
  final storage = FlutterSecureStorage();
  final List<Vacancy> vacancies = [];

  int page = 1;
  bool isLoading = false;
  ScrollController _scrollControllerVacancies = ScrollController();
  ScrollController _scrollControllerResponse = ScrollController();
  final String access_token = "aaa";
  final String agent_id = "aaa";

  bool _isVacancies = true;
  bool _isResponds = false;

  @override
  void initState() {
    super.initState();
    _scrollControllerVacancies.addListener(_scrollListener);
    _fetchVacancies();
  }

  @override
  void dispose() {
    _scrollControllerVacancies.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollControllerVacancies.position.pixels ==
        _scrollControllerVacancies.position.maxScrollExtent) {
      _fetchVacancies();
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

  void _onPressedVacancies() {
    setState(() {
      _isVacancies = true;
      _isResponds = false;
    });
  }

  void _onPressedResponds() {
    setState(() {
      _isVacancies = false;
      _isResponds = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        clipBehavior: Clip.none,
        title: Text(
          'Список вакансий',
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
      body: Column(
        children: [
          TopButtons(
            isVacancies: _isVacancies,
            onPressedVacancies: _onPressedVacancies,
            isResponds: _isResponds,
            onPressedResponds: _onPressedResponds,
          ),
          _isVacancies
              ? Flexible(child: _vacancyListBuilder())
              : Flexible(child: _respondsListBuilder()),
        ],
      ),
      // body: _vacancyListBuilder(),
    );
  }

  ListView _vacancyListBuilder() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      controller: _scrollControllerVacancies,
      itemCount: vacancies.length + 1,
      itemBuilder: (context, index) {
        if (index == vacancies.length) {
          return isLoading ? CircularProgressIndicator() : Container();
        }
        final vacancy = vacancies[index];
        var imageBytes = base64Decode(vacancy.picture);
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
      controller: _scrollControllerResponse,
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
}
