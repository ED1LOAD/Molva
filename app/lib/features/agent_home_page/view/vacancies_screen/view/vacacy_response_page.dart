import 'package:app/features/agent_home_page/view/vacancies_screen/view/resume_screen.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/vacancy.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyResponsePage extends StatefulWidget {
  final Vacancy vacancy;
  const VacancyResponsePage({
    super.key,
    required this.vacancy,
  });

  @override
  State<VacancyResponsePage> createState() => _VacancyResponsePageState();
}

class _VacancyResponsePageState extends State<VacancyResponsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        clipBehavior: Clip.none,
        title: Text(
          widget.vacancy.title,
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
      body: const Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResposnseBlock(
              name: "Отклик без имени",
              date: "17 июня",
            ),
            SizedBox(height: 10),
            ResposnseBlock(
              name: "Иванов Иван Иванович",
              date: "17 июня",
            ),
            SizedBox(height: 10),
            ResposnseBlock(
              name: "Сергеев Сергей Сергеевич",
              date: "17 июня",
            ),
          ],
        ),
      ),
    );
  }
}

class ResposnseBlock extends StatelessWidget {
  final String name;
  final String date;
  const ResposnseBlock({
    super.key,
    this.name = "Отклик без имени",
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResumeScreen(),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 63,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                  Text(
                    date,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12.0,
                        ),
                  )
                ],
              ),
              const Spacer(),
              SvgPicture.asset("assets/vacancies/arrow.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
