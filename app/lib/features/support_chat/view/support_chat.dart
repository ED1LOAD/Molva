// ignore_for_file: avoid_print

import 'package:app/features/agent_home_page/view/balances_screen.dart';
import 'package:app/features/distributor_home_page/view/vacancies_screen.dart';
import 'package:app/features/distributor_pesonal_account/view/settings_page.dart';
import 'package:app/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({super.key});

  @override
  SupportChatScreenState createState() => SupportChatScreenState();
}

class SupportChatScreenState extends State<SupportChatScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    const BalancesScreen(), // Экран балансов
    const VacanciesScreenDistributor(), // Экран вакансий
    CompanyManagementPage(), // Экран настроек
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F5F7),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Column(
            children: [
              AppBar(
                centerTitle: true,
                title: Text(
                  'Чат с тех.поддержкой',
                  style: customTheme.bodyMedium,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: const Color(0xFFF5F5F7),
                elevation: 0,
              ),
              Container(
                height: 1.0,
                color: const Color(
                  0xFFB8B8B8,
                ),
              )
            ],
          ),
        ),
        body: const SupportChatInterface(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Баланс',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Вакансии',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}

class SupportChatInterface extends StatefulWidget {
  const SupportChatInterface({super.key});

  @override
  SupportChatInterfaceState createState() => SupportChatInterfaceState();
}

class SupportChatInterfaceState extends State<SupportChatInterface> {
  List<Map<String, dynamic>> messages = [
    {
      "text":
          "Отлично! Валидация вашей компании пройдена успешно. Начинайте деятельность.",
      "isFromUser": false
    }
  ];
  final TextEditingController _controller = TextEditingController();

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      print('File name: ${file.name}');
      print('File path: ${file.path}');

      setState(() {
        messages.add({
          "text": "Файл: ${file.name}",
          "isFromUser": true,
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            reverse: true,
            padding: const EdgeInsets.all(8.0),
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              int reverseIndex = messages.length - 1 - index;
              return SupportChatBubble(
                message: messages[reverseIndex]['text'],
                isFromUser: messages[reverseIndex]['isFromUser'],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 12.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                          color: const Color(0xFFEEEEF1),
                          width: 1.0,
                        )),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: "Введите сообщение",
                              hintStyle: TextStyle(color: Color(0xEEB8B8B8)),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.attach_file),
                          color: Colors.grey,
                          onPressed: pickFile,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                    gradient: const RadialGradient(
                        center: Alignment.center,
                        colors: [
                          Color(0xFF07B7F8),
                          Color(0xFF0582EE),
                        ],
                        radius: 1.0),
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.white,
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        setState(() {
                          messages.add({
                            "text": _controller.text,
                            "isFromUser": true,
                          });
                          _controller.clear();
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Нельзя отправить пустое сообщение'),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SupportChatBubble extends StatelessWidget {
  final String message;
  final bool isFromUser;

  const SupportChatBubble(
      {super.key, required this.message, this.isFromUser = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment:
            isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isFromUser ? const Color(0xFFD7ECFF) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isFromUser ? 15.0 : 0.0),
                  topRight: Radius.circular(isFromUser ? 0.0 : 15.0),
                  bottomLeft: const Radius.circular(15.0),
                  bottomRight: const Radius.circular(15.0),
                ),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
