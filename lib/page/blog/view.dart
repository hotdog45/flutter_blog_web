import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/widget/nav_widget.dart';
import 'package:my_blog/page/main/components/header.dart';
import 'package:my_blog/page/main/components/side_menu.dart';
import 'package:my_blog/page/main/menu_controller.dart';

import '../../constants.dart';
import 'logic.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final blogLogic logic = Get.put(blogLogic());

  @override
    Widget build(BuildContext context) {
    return NavWidget(child: Center(child: Text("博客列表",style: TextStyle(fontSize: 40),)));

  }

  @override
  void dispose() {
    Get.delete<blogLogic>();
    super.dispose();
  }
}