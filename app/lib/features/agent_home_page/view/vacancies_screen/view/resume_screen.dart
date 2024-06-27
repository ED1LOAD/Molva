import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        clipBehavior: Clip.none,
        title: Text(
          "Отклик",
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
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(text: "Резюме Иванов И.И.docx"),
              const SizedBox(height: 20),
              Text(
                "Резюме:",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 10),
              const TextField(text: "Иванов Иван Иванович"),
              const SizedBox(height: 10),
              const TextField(text: "+7-999-999-9999"),
              const SizedBox(height: 10),
              const TextField(text: "mail@mail.ru"),
              const SizedBox(height: 10),
              const TextField(text: "01.01.2000"),
            ],
          ),
        ),
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final String text;
  const TextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    );
  }
}
