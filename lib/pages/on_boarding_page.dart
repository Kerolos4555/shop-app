import 'package:shop_app/helper/cached_helper.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/pages/login_page.dart';
import 'package:shop_app/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController boardController = PageController();

  List<BoardingModel> boardingList = const [
    BoardingModel(
      image: 'assets/images/store_onboarding.png',
      title: 'On Boarding E-Commerce image 1',
      body: 'On Boarding E-Commerce body 1',
    ),
    BoardingModel(
      image: 'assets/images/store_onboarding.png',
      title: 'On Boarding E-Commerce image 2',
      body: 'On Boarding E-Commerce body 2',
    ),
    BoardingModel(
      image: 'assets/images/store_onboarding.png',
      title: 'On Boarding E-Commerce image 3',
      body: 'On Boarding E-Commerce body 3',
    ),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
            child: const Text(
              'SKIP',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                itemBuilder: (context, index) {
                  return OnBoardingItem(boardingModel: boardingList[index]);
                },
                itemCount: boardingList.length,
                onPageChanged: (index) {
                  if (index == boardingList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5,
                  ),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                        duration: const Duration(microseconds: 750),
                        curve: Curves.fastEaseInToSlowEaseOut,
                      );
                    }
                  },
                  color: Colors.blue,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    CachedHelper.saveData(
      key: 'OnBoarding',
      value: true,
    ).then(
      (value) {
        if (value) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginPage();
              },
            ),
            (route) => false,
          );
        }
      },
    );
  }
}
