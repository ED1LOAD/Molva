import 'package:flutter/material.dart';
import 'vacancy.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({super.key});

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  final List<Client> clients = [
    Client(
      'Иванов Иван Иванович',
      '5HkI1@example.com',
      '+7 999 999 99 99',
      'Описание клиента',
      Vacancy(
        id: 0,
        title: 'Вечерний консультант в Тинькофф Банке (удалённо)',
        company: "Тинькофф",
        date: "15 мая",
        description: 'от 35 000 ₽',
        picture: "assets/tink.png",
        cost: 10000,
      ),
    ),
    Client(
      'Иванов Иван Иванович',
      '5HkI1@example.com',
      '+7 999 999 99 99',
      'Описание клиента',
      Vacancy(
        id: 1,
        title: 'Финансовый аналитик в Финтех',
        company: "Yandex",
        date: "15 мая",
        description: 'от 100 000 ₽',
        picture: "assets/yandex.png",
        cost: 10000,
      ),
    ),
    Client(
      'Иванов Иван Иванович',
      '5HkI1@example.com',
      '+7 999 999 99 99',
      'Описание клиента',
      Vacancy(
        id: 2,
        title: 'Финансовый аналитик в Финтех',
        company: "Yandex",
        date: "15 мая",
        description: 'от 100 000 ₽',
        picture: "assets/yandex.png",
        cost: 10000,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Отклики'),
        ),
        body: ListView.builder(
            itemCount: clients.length,
            itemBuilder: (context, index) {
              final client = clients[index];
              final vacancy = client.vacancy;
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                child: Column(
                  children: [
                    Column(
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
                    const SizedBox(height: 10.0),
                  ],
                ),
              );
            }));
  }
}

class Client {
  final String fio;
  final String email;
  final String phone;
  final String about;
  final Vacancy vacancy;

  Client(this.fio, this.email, this.phone, this.about, this.vacancy);
}
