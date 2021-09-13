import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/widget/nav_widget.dart';
import 'package:my_blog/page/home/home_screen.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/header.dart';
import 'components/side_menu.dart';
import 'menu_controller.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // HeaderView(),
            Container(
              // padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: SafeArea(child: HomeScreen()),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderView extends StatelessWidget {
  const HeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkBlackColor,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: kDefaultPadding * 2),
          Text(
            "Welcome to Our Blog",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Text(
              "Stay updated with the newest design and development stories, case studies, \nand insights shared by DesignDK Team.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                height: 1.5,
              ),
            ),
          ),
          FittedBox(
            child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "Learn More",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: kDefaultPadding / 2),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          if (Responsive.isDesktop(context)) SizedBox(height: kDefaultPadding),
          SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
