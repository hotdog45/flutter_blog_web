import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/page/main/components/header.dart';
import 'package:my_blog/page/main/components/side_menu.dart';
import 'package:my_blog/page/main/menu_controller.dart';

import '../../constants.dart';

class NavWidget extends StatelessWidget {
  final MenuController _controller = Get.put(MenuController());

  final child;

  NavWidget({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _controller.scaffoldkey,
      drawer: SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              constraints: BoxConstraints(maxWidth: kMaxWidth),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
