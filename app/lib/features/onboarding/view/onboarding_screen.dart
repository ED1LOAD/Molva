import 'package:app/theme.dart';
import 'package:flutter/material.dart';
import 'package:app/features/onboarding/widgets/view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Widget> _onboardingPages = [
    const MegaPhone(),
    const Settings(),
    const Contract(),
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            pageBody(),
            nextButton(context),
            dotIndicator(),
          ],
        ),
      ),
    );
  }

  MaterialButton nextButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_currentPage == _onboardingPages.length - 1) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/authorization', (route) => false);
        }
        setState(() {
          _currentPage++;
        });
        setState(() {
          _pageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        });
      },
      child: Container(
        width: 320,
        height: 36,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            _currentPage != _onboardingPages.length - 1
                ? "Далее"
                : "К регистрации",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }

  SizedBox dotIndicator() {
    return SizedBox(
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
    );
  }

  Flexible pageBody() {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: PageView.builder(
        itemCount: _onboardingPages.length,
        controller: _pageController,
        onPageChanged: (currentPage) {
          setState(() {
            _currentPage = currentPage;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedOpacity(
            opacity: _currentPage == index ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: _onboardingPages[index],
          );
        },
      ),
    );
  }
}
