import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
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
              const SizedBox(height: 20),
              Row(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       gradient: const RadialGradient(
                  //         center: Alignment.topCenter,
                  //         radius: 2.0,
                  //         colors: [
                  //           Color(0xFF07B7F8),
                  //           Color(0xFF0582EE),
                  //         ],
                  //       ),
                  //     ),
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/calendar');
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
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
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    // Expanded(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10),
                    //       gradient: const RadialGradient(
                    //         center: Alignment.topCenter,
                    //         radius: 2.0,
                    //         colors: [
                    //           Color(0xFF07B7F8),
                    //           Color(0xFF0582EE),
                    //         ],
                    //       ),
                    //     ),
                    //     child: ElevatedButton(
                    //       onPressed: () {
                    //         Navigator.pushNamed(context, '/calendar');
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
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .bodyMedium
                    //             ?.copyWith(
                    //               color: Colors.white,
                    //             ),
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
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
