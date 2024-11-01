import 'package:app/features/distributor_pesonal_account/view/distributor_bank_props.dart';
import 'package:app/features/distributor_pesonal_account/view/main_page.dart';
import 'package:app/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      child: SizedBox(
        width: double.infinity, // Full width
        height: 36,
        child: Container(
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
      ),
    );
  }
}

class BankButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BankButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 36,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff888888),
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
      ),
    );
  }
}

class CompanyRequirementsLE extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  CompanyRequirementsLE({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobileLayout = !kIsWeb || MediaQuery.of(context).size.width < 800;
    return isMobileLayout
        ? _buildMobileLayout(context)
        : _buildWebLayout(context);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color(0xFFF5F5F7),
          flexibleSpace: const Padding(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Center(
              child: Text(
                'Данные компании',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Graphik LCG',
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: const TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF5F5F7),
                hintText: 'Название Юр.лица',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0C0C0C),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              style: const TextStyle(
                fontFamily: 'Graphik LCG',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF5F5F7),
                hintText: 'ИНН/ОГРН',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF0C0C0C),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F7),
                hintText: 'Юр. адрес',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff0C0C0C),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(11)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            BankButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BankDetails()));
              },
              text: 'Банковские реквизиты',
            ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DistHomePage()),
                );
              },
              text: 'Редактировать',
            ),
            const SizedBox(
              height: 25,
            ),
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
              flexibleSpace: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Center(
                  child: Text(
                    'Данные компании',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Graphik LCG',
                    ),
                  ),
                ),
              ),
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  style: const TextStyle(
                    fontFamily: 'Graphik LCG',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F5F7),
                    hintText: 'Название Юр.лица',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0C0C0C),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: const TextStyle(
                    fontFamily: 'Graphik LCG',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF5F5F7),
                    hintText: 'ИНН/ОГРН',
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0C0C0C),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF5F5F7),
                    hintText: 'Юр. адрес',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff0C0C0C),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(11)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BankButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BankDetails()));
                  },
                  text: 'Банковские реквизиты',
                ),
                const Spacer(),
                const Text(
                  'После редактирования с вами свяжется поддержка для уточнения информации, после чего она будет изменена',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF888888),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SaveButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DistHomePage()),
                    );
                  },
                  text: 'Редактировать',
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
