import 'package:flutter/material.dart';
import 'package:app/features/onboarding/widgets/view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<OboardContent> _onboardingPages = [
    OboardContent(
      title: 'Исследуйте новый канал привлечения сотрудников',
      description: 'Размещайте вакансию или привлекайте кандидатов',
      button: '',
    ),
    OboardContent(
      title:
          'Рекомендации по кандидатам и флоу их ведения теперь в одном месте',
      description: '',
      button: '',
    ),
    OboardContent(
      title: '-Вакансия -\n- рекомендация -\n- трудоустройство -',
      description: '',
      button: 'К регистрации',
    ),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: _onboardingPages.length,
                controller: _pageController,
                onPageChanged: (currentPage) {
                  setState(() {
                    _currentPage = currentPage;
                  });
                },
                itemBuilder: (context, index) => OnboardingPage(
                  title: _onboardingPages[index].title,
                  description: _onboardingPages[index].description,
                  button: _onboardingPages[index].button,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 60,
              child: Row(
                children: List<Widget>.generate(
                  _onboardingPages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: DotIndicator(
                      isActive: index == _currentPage,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
