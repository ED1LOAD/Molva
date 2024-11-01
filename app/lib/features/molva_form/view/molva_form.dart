import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class JobApplicationForm extends StatefulWidget {
  const JobApplicationForm({super.key});

  @override
  JobApplicationFormState createState() => JobApplicationFormState();
}

class JobApplicationFormState extends State<JobApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isAgreed = false;
  String? _resumeFileName;

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;

    return isMobileLayout ? _buildMobileLayout() : _buildWebLayout();
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _buildFormContent(),
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
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/molva.svg',
                    height: 28,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/ios.svg'),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: SvgPicture.asset('assets/icons/android.svg'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 1024,
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 10.0,
                spreadRadius: 5.0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Golang разработчик",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: _buildSectionWithTitle("Прикрепите резюме:",
                            _buildResumeAttachmentSection())),
                    const SizedBox(width: 20),
                    Expanded(
                        child: _buildSectionWithTitle(
                            "Приложите ссылку на резюме:",
                            _buildLinkSection())),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSectionTitle("Заполните данные:"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _buildCustomTextField('ФИО')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildCustomTextField('Телефон')),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _buildCustomTextField('Эл. почта')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildCustomTextField('Дата рождения')),
                  ],
                ),
                const SizedBox(height: 10),
                _buildCustomTextField('Опишите навыки', maxLines: 3),
                const SizedBox(height: 20),
                _buildAgreementCheckbox(),
                const SizedBox(height: 20),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/molva.svg',
            height: 28,
          ),
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset('assets/icons/ios.svg'),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset('assets/icons/android.svg'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Golang разработчик",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          _buildSectionTitle("Прикрепите резюме:"),
          const SizedBox(height: 10),
          _buildResumeAttachmentSection(),
          const SizedBox(height: 20),
          _buildSectionTitle("Приложите ссылку на резюме:"),
          const SizedBox(height: 10),
          _buildLinkSection(),
          const SizedBox(height: 20),
          _buildSectionTitle("Заполните данные:"),
          const SizedBox(height: 10),
          _buildDataInputSection(),
          const SizedBox(height: 20),
          _buildAgreementCheckbox(),
          const SizedBox(height: 20),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildSectionWithTitle(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        child,
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildResumeAttachmentSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              _resumeFileName ?? "Выберите файл",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF888888),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                setState(() {
                  _resumeFileName = result.files.single.name;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: gradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(
                'assets/icons/attach_file.svg',
                height: 24,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLinkSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Вставьте ссылку",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF888888),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              'assets/icons/link.svg',
              height: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCustomTextField('ФИО'),
        const SizedBox(height: 10),
        _buildCustomTextField('Телефон'),
        const SizedBox(height: 10),
        _buildCustomTextField('Эл. почта'),
        const SizedBox(height: 10),
        _buildCustomTextField('Дата рождения'),
        const SizedBox(height: 10),
        _buildCustomTextField('Опишите навыки', maxLines: 3),
      ],
    );
  }

  Widget _buildCustomTextField(String hintText, {int maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF888888),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAgreementCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isAgreed,
          activeColor: Colors.blue,
          onChanged: (bool? value) {
            setState(() {
              _isAgreed = value ?? false;
            });
          },
        ),
        const Expanded(
          child: Text(
            "Я соглашаюсь на передачу и обработку моих персональных данных",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff888888),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return MaterialButton(
      onPressed: () {
        if (_formKey.currentState!.validate() && _isAgreed) {
          // Submit logic here
        }
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Отправить',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
