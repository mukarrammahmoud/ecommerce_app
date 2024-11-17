import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/app_image.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  late PageController _pageController;

  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to STYLISTA, Lets shop!",
      "image": AppImages.splashOne,
    },
    {
      "text": "We help people connect with stores",
      "image": AppImages.splashTow,
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": AppImages.splashThree,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (currentPage < splashData.length) {
      currentPage++;
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }

    if (currentPage == 3) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoot.login, (route) => false);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? AppColor.priomaryColorApp
                                  : AppColor.successColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              colorBorder:
                                  AppColor.neutralsColor.withOpacity(.5),
                              color: AppColor.splashColor,
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoot.login, (route) => false);
                              },
                              title: const AppText(
                                text: "Skip",
                              ),
                            ),
                          ),
                          Expanded(
                            child: CustomButton(
                              onPressed: _nextPage,
                              title: const AppText(
                                text: "Next",
                                textColor: AppColor.splashColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    image!,
                    fit: BoxFit.contain,
                    height: 120,
                    width: 100,
                  ),
                  Image.asset(
                    image!,
                    fit: BoxFit.contain,
                    height: 120,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.asset(
                    image!,
                    fit: BoxFit.contain,
                    height: 200,
                    width: 120,
                  ),
                  Image.asset(
                    image!,
                    fit: BoxFit.contain,
                    height: 200,
                    width: 120,
                  ),
                ],
              ),
            ],
          ),
          const AppText(
            text: "Find Your Perfect Style",
            fontSize: 30,
            isBold: true,
          ),
        ],
      ),
    );
  }
}
