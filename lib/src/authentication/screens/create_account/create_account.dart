import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'page_1.dart';
import 'page_2.dart';
import 'page_3.dart';
import 'page_4.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final pageController = PageController(
    initialPage: 0,
  );

  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    const double kProgressWidth = 180;

    nextPage() {
      pageController.nextPage(
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      );
    }

    prevPage() {
      pageController.previousPage(
        duration: const Duration(
          milliseconds: 200,
        ),
        curve: Curves.easeIn,
      );
    }

    List<Widget> pageViews = [
      CreateAccountPage1(nextPage: nextPage),
      CreateAccountPage2(nextPage: nextPage),
      CreateAccountPage3(nextPage: nextPage),
      CreateAccountPage4(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        leading: IconButton(
          onPressed: () {
            if (currentPage == 0) {
              Navigator.pop(context);
              return;
            }

            prevPage();
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft),
        ),
        elevation: 0.0,
        title: Stack(
          children: [
            Container(
              height: 2.0,
              width: kProgressWidth,
              color: const Color.fromARGB(255, 186, 186, 186),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: 2.0,
                width: kProgressWidth * 0.25 * (currentPage + 1),
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                '${currentPage + 1}/4',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: pageViews.length,
        itemBuilder: (context, index) {
          return pageViews[index];
        },
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
