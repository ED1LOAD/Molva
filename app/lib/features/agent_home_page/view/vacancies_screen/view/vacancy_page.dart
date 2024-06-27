import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/vacancy_cost.dart';
import 'package:app/features/agent_home_page/view/vacancies_screen/widgets/view.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VacancyPage extends StatefulWidget {
  final Vacancy vacancy;
  final Uint8List imageBytes;
  const VacancyPage({
    super.key,
    required this.vacancy,
    required this.imageBytes,
  });

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  LinkGenerator linkGenerator = LinkGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: darkgray,
        ),
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
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 3.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VacancyHeading(
                    imageBytes: widget.imageBytes,
                    vacancy: widget.vacancy,
                  ),
                  VacancyCost(
                    vacancy: widget.vacancy,
                    subtextStyle:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocksWidget(
                    text1: "Требуемый опыт работы:",
                    subtext1: "5 лет",
                    text2: "Формат работы:",
                    subtext2: "Полная занятость",
                    subtextStyle:
                        Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextBlock(
                    text: "Адрес:",
                    subtext: "Москва, ул. Московкая, д.35",
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBlock(
                    text: "Описание компании:",
                    subtext:
                        """А ещё сторонники тоталитаризма в науке превращены в посмешище, хотя само их существование приносит несомненную пользу обществу. Повседневная практика показывает, что современная методология разработки предоставляет широкие возможности для инновационных методов управления процессами. 
С учётом сложившейся международной обстановки, разбавленное изрядной долей эмпатии, рациональное мышление позволяет выполнить важные задания по разработке переосмысления внешнеэкономических политик.""",
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 19.6 / 14,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBlock(
                    text: "Требование к кандидату:",
                    subtext:
                        """А ещё сторонники тоталитаризма в науке превращены в посмешище, хотя само их существование приносит несомненную пользу обществу. Повседневная практика показывает, что современная методология разработки предоставляет широкие возможности для инновационных методов управления процессами. 
С учётом сложившейся международной обстановки, разбавленное изрядной долей эмпатии, рациональное мышление позволяет выполнить важные задания по разработке переосмысления внешнеэкономических политик.""",
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 19.6 / 14,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextBlock(
                    text: "Обязанности:",
                    subtext:
                        """1. Нынче никто не может себе позволить инициировать звон колоколов
2. Инцидент не исчерпан: помыслы поколения чисты
3. Сейчас всё чаще звучит звон колоколов
4. Нет звука приятнее, чем полуночный пёсий вой""",
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 19.6 / 14,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _copyLinkButton(context),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  MaterialButton _copyLinkButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        linkGenerator.CopyToClipboard(context);
      },
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Копировать",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}

class TextBlock extends StatelessWidget {
  const TextBlock({
    super.key,
    required this.text,
    required this.subtext,
    required this.textStyle,
  });

  final String text;
  final String subtext;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CostBlock(
            text: text,
            subtext: subtext,
            subtextStyle: textStyle,
          ),
        ),
      ],
    );
  }
}
