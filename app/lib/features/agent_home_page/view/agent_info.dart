import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AgentRequirements extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AgentRequirements({super.key});

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
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: background,
        title: const Text(
          'Данные компании',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Graphik LCG',
          ),
        ),
        centerTitle: true,
      ),
      body: _buildFormContent(context),
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
              toolbarHeight: 70,
              backgroundColor: background,
              title: const Text(
                'Данные компании',
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
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(15.0),
          child: _buildFormContent(context),
        ),
      ),
    );
  }

  Widget _buildFormContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text fields and other form elements...
          _buildTextField('Название Юр.лица'),
          const SizedBox(height: 10),
          _buildTextField('ИНН/ОГРН'),
          const SizedBox(height: 10),
          _buildTextField('Р/С'),
          const SizedBox(height: 10),
          _buildTextField('Корр. счет'),
          const SizedBox(height: 10),
          _buildTextField('БИК'),
          const SizedBox(height: 10),
          _buildTextField('КПП'),
          const SizedBox(height: 10),
          _buildTextField('Юр. адрес'),
          const SizedBox(height: 10),
          const Spacer(),
          const Text(
            'После редактирования с вами свяжется поддержка для уточнения информации, после чего она будет изменена',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF888888),
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          SaveButton(
            onPressed: () {},
            text: 'Редактировать',
          ),
          const SizedBox(height: 25),
        ],
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
        fillColor: const Color(0xFFF5F5F5),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFf0C0C0C),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SaveButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
          ),
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
