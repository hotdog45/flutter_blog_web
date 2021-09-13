import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/test/nav_page.dart';

import '../../../constants.dart';
import '../../../responsive.dart';
import '../menu_controller.dart';
import 'socal.dart';
import 'web_menu.dart';

class Header extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: Container(
        constraints: BoxConstraints(maxWidth: kMaxWidth),
        padding: EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  _controller.openOrCloseDrawer();
                },
              ),
            // SvgPicture.asset("assets/icons/logo.svg"),
            IconButton(
              icon: Icon(
                Icons.camera,
                size: 33,
              ),
              onPressed: () {
                Get.to(NavigatorPage());
              },
            ),
            Spacer(),
            if (Responsive.isDesktop(context)) WebMenu(),
            Spacer(),
            // Socal
            Socal(),
          ],
        ),
      ),
    );
  }
}
