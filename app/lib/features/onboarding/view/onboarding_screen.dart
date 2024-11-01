import 'package:app/features/onboarding/widgets/dot_indicator.dart';
import 'package:app/features/onboarding/widgets/onboarding_page.dart';
import 'package:app/theme.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  final List<Widget> _onboardingPages = [
    const FirstSection(),
    const SecondSection(),
    const ThirdSection(),
  ];

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Expanded(
            child: pageBody(),
          ),
          const SizedBox(height: 10),
          nextButton(context),
          Center(child: dotIndicator())
        ],
      ),
    );
  }

  Widget nextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWebLayout = constraints.maxWidth >= 800;

          return Column(
            children: [
              Container(
                height: 50,
                width: isWebLayout ? 300 : double.infinity,
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (_currentPage == _onboardingPages.length - 1) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/toregistration', (route) => false);
                    } else {
                      setState(() {
                        _currentPage++;
                        _pageController.animateToPage(
                          _currentPage,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      });
                    }
                  },
                  child: Center(
                    child: Text(
                      _currentPage != _onboardingPages.length - 1
                          ? "Далее"
                          : "Регистрация",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (_currentPage == _onboardingPages.length - 1)
                Container(
                  height: 50,
                  width: isWebLayout ? 300 : double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF07B7F8), Color(0xFF0582EE)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/authorization');
                    },
                    child: Center(
                      child: Text(
                        "Вход",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget dotIndicator() {
    final list = List<Widget>.generate(
      _onboardingPages.length,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 5),
        child: DotIndicator(
          isActive: index == _currentPage,
        ),
      ),
    );
    return SizedBox(
      height: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        ),
      ),
    );
  }

  Widget pageBody() {
    return PageView.builder(
      itemCount: _onboardingPages.length,
      controller: _pageController,
      onPageChanged: (currentPage) {
        setState(() {
          _currentPage = currentPage;
        });
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            Expanded(
              child: _onboardingPages[index],
            ),
          ],
        );
      },
    );
  }
}
