import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/widget/nav_widget.dart';

import 'logic.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  final archiveLogic logic = Get.put(archiveLogic());

  @override
    Widget build(BuildContext context) {
    return NavWidget(child: Center(child: Text("归档",style: TextStyle(fontSize: 40),)));
    }

  @override
  void dispose() {
    Get.delete<archiveLogic>();
    super.dispose();
  }
}