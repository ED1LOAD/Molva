import 'package:flutter/material.dart';

class RegistrationPageAgent extends StatefulWidget {
  @override
  _RegistrationPageAgentState createState() => _RegistrationPageAgentState();
}

class _RegistrationPageAgentState extends State<RegistrationPageAgent> {
  bool isPerson = true;
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 206.0),
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: 360),
            padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Регистрация',
                  style: TextStyle(
                    fontSize: 18, // Уменьшенный шрифт
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Я публикую вакансии для своей компании',
                  style: TextStyle(fontSize: 14), // Уменьшенный шрифт
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildFormField('ФИО'),
                      SizedBox(height: 10),
                      _buildFormField('Эл. почта'),
                      SizedBox(height: 10),
                      _buildFormField('Телефон'),
                      SizedBox(height: 10),
                      _buildFormField('Пароль', obscureText: true),
                      SizedBox(height: 10),
                      _buildFormField('Повторите пароль', obscureText: true),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildChoiceButton('Физ. лицо', isPerson, true),
                    _buildChoiceButton('Юр. лицо', !isPerson, false),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _buildCheckbox(),
                    Expanded(
                      child: Text(
                        'Я прочитал и согласен с условиями Пользовательского соглашения',
                        style: TextStyle(fontSize: 12), // Уменьшенный шрифт
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Полностью округлые границы
                      gradient: LinearGradient(
                        colors: [Color(0xFF07B7F8), Color(0xFF0582EE)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle form submission
                        }
                      },
                      child: Text(
                        'Регистрация',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14, // Уменьшенный шрифт
                        ),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 9, horizontal: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Полностью округлые границы
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String labelText, {bool obscureText = false}) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(20), // Полностью округлые границы
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 11, horizontal: 12),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 12), // Уменьшенный шрифт
          hintStyle: TextStyle(fontSize: 12), // Уменьшенный шрифт для hint text
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20), // Полностью округлые границы
          ),
        ),
        style: TextStyle(fontSize: 12), // Уменьшенный шрифт для вводимого текста
        obscureText: obscureText,
      ),
    );
  }

  Widget _buildChoiceButton(String text, bool isSelected, bool isPerson) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            this.isPerson = isPerson;
          });
        },
        child: Container(
          height: 44,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F7),
            borderRadius: BorderRadius.circular(20), // Полностью округлые границы
            border: Border.all(
              color: isSelected ? Color(0xFF0582EE) : Colors.transparent,
            ),
          ),
          child: Row(
            children: [
              Radio<bool>(
                value: isPerson,
                groupValue: this.isPerson,
                onChanged: (bool? value) {
                  setState(() {
                    this.isPerson = value ?? true;
                  });
                },
                activeColor: Color(0xFF0582EE),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12, // Уменьшенный шрифт
                  fontFamily: 'Graphik LCG',
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF888888),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        width: 22,
        height: 22,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isChecked ? Color(0xFF0582EE) : Color(0xFFF5F5F7),
          border: isChecked
              ? null
              : Border.all(
                  color: Colors.grey,
                ),
        ),
        child: isChecked
            ? Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  size: 14,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
