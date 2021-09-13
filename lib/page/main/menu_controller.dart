import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/page/about/view.dart';
import 'package:my_blog/page/archive/view.dart';
import 'package:my_blog/page/blog/view.dart';
import 'package:my_blog/page/magic_box/view.dart';
import 'package:my_blog/page/main/main_screen.dart';
import 'package:my_blog/page/service/view.dart';

class MenuController extends GetxController {
  RxInt _selectedIndex = 0.obs;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int get selectedIndex => _selectedIndex.value;
  List<String> get menuItems => ["首页", "服务", "归档", "百宝箱", "Blog", "关于"];
  GlobalKey<ScaffoldState> get scaffoldkey => _scaffoldKey;

  void openOrCloseDrawer() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    } else {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  void setMenuIndex(int index) {
    _selectedIndex.value = index;
    if (index == 0) {
      Get.offNamed('/');
    } else if (index == 1) {
      Get.to(ServicePage());
    } else if (index == 2) {
      Get.to(ArchivePage());
    } else if (index == 3) {
      Get.to(MagicBoxPage());
    } else if (index == 4) {
      Get.to(BlogPage());
    } else if (index == 5) {
      Get.to(AboutPage());
    }
  }
}
