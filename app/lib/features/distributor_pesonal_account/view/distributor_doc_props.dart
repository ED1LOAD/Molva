import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app/theme.dart';

class SaveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SaveButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

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
  }
}

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Реквизиты',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Graphik LCG',
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Заполните данные',
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            _buildTextField('Серия номер паспорта'),
            const SizedBox(height: 10),
            _buildTextField('Дата выдачи'),
            const SizedBox(height: 10),
            _buildTextField('Кем выдан'),
            const SizedBox(height: 10),
            _buildTextField('Код подразделения'),
            const SizedBox(height: 10),
            _buildTextField('Место рождения'),
            const SizedBox(height: 10),
            _buildTextField('Адрес регистрации'),
            const SizedBox(height: 10),
            _buildTextField('ИНН'),
            const SizedBox(height: 15),
            const Text(
              'Загрузите документы',
              style: TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildUploadButton('Паспорт'),
            const SizedBox(height: 10),
            _buildUploadButton('Регистрация'),
            const Spacer(),
            SaveButton(
              onPressed: () {
                // Save action here
              },
              text: 'Сохранить',
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1024),
            child: AppBar(
              backgroundColor: background,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text(
                'Реквизиты',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Graphik LCG',
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1024),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 20.0,
                spreadRadius: 10.0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Заполните данные',
                style: TextStyle(
                  fontFamily: 'Graphik LCG',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              _buildTextField('Серия номер паспорта'),
              const SizedBox(height: 10),
              _buildTextField('Дата выдачи'),
              const SizedBox(height: 10),
              _buildTextField('Кем выдан'),
              const SizedBox(height: 10),
              _buildTextField('Код подразделения'),
              const SizedBox(height: 10),
              _buildTextField('Место рождения'),
              const SizedBox(height: 10),
              _buildTextField('Адрес регистрации'),
              const SizedBox(height: 10),
              _buildTextField('ИНН'),
              const SizedBox(height: 15),
              const Text(
                'Загрузите документы',
                style: TextStyle(
                  fontFamily: 'Graphik LCG',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildUploadButton('Паспорт'),
              const SizedBox(height: 10),
              _buildUploadButton('Регистрация'),
              const Spacer(),
              SaveButton(
                onPressed: () {
                  // Save action here
                },
                text: 'Сохранить',
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      style: const TextStyle(
        fontFamily: 'Graphik LCG',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF5F5F7),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildUploadButton(String label) {
    return GestureDetector(
      onTap: () {
        // Upload action here
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Color(0xFF888888)),
            ),
            const Icon(Icons.attach_file, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
