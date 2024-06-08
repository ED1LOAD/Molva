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

  @override
  void initState() {
    super.initState();
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageData(context),
            pageBody(),
            nextButton(context),
            dotIndicator(),
          ],
        ),
      ),
    );
  }

  SizedBox imageData(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Image(
        image: const AssetImage('assets/onboarding/combined.png'),
        alignment: Alignment(-1.2 + 1.1 * _currentPage, 0),
        width: 1000,
        height: 334,
        fit: BoxFit.cover,
      ),
    );
  }

  MaterialButton nextButton(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (_currentPage == _onboardingPages.length - 1) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/toregistration', (route) => false);
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
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
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
      ),
    );
  }

  SizedBox dotIndicator() {
    final list = List<Widget>.generate(
      _onboardingPages.length - 1,
      (index) => Padding(
        padding: const EdgeInsets.only(right: 5),
        child: DotIndicator(
          isActive: index == _currentPage,
        ),
      ),
    );
    list.add(DotIndicator(
      isActive: _currentPage == _onboardingPages.length - 1,
    ));
    return SizedBox(
      height: 60,
      width: 60,
      child: Row(
        children: list,
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
