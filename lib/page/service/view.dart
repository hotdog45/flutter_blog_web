import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/widget/nav_widget.dart';

import 'logic.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final serviceLogic logic = Get.put(serviceLogic());

  @override
  Widget build(BuildContext context) {
    return NavWidget(
        child: Center(
            child: Text(
      "服务",
      style: TextStyle(fontSize: 40),
    )));
  }

  @override
  void dispose() {
    Get.delete<serviceLogic>();
    super.dispose();
  }
}
