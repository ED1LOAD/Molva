import 'package:app/features/agent_home_page/view/vacancies_screen/view/resume_screen.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/vacancy.dart';
import 'package:app/features/calendar/view/calendar.dart';
import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
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
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout ? _buildMobileLayout() : _buildWebLayout();
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
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
        padding: EdgeInsets.symmetric(horizontal: 15),
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

  Widget _buildWebLayout() {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            child: AppBar(
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
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Column(
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.0,
                                  ),
                        ),
                        Text(
                          date,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/vacancies/arrow.svg"),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       gradient: gradient,
                  //     ),
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) =>
                  //                     const CustomCalendarScreen()));
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         padding: const EdgeInsets.symmetric(
                  //           vertical: 10,
                  //         ),
                  //         backgroundColor: Colors.transparent,
                  //         shadowColor: Colors.transparent,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //       ),
                  //       child: Text(
                  //         "Назначить дату",
                  //         style:
                  //             Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //                   color: Colors.white,
                  //                 ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF888888),
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Отклонить",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
