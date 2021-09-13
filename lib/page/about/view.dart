import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/widget/nav_widget.dart';

import 'logic.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final aboutLogic logic = Get.put(aboutLogic());

  @override
  Widget build(BuildContext context) {
    return NavWidget(child: Center(child: Text("关于我",style: TextStyle(fontSize: 40),)));
  }

  @override
  void dispose() {
    Get.delete<aboutLogic>();
    super.dispose();
  }
}
