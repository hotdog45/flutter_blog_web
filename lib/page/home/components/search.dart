import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'sidebar_container.dart';

class Search extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "搜索",
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: "请输入关键字",
          suffixIcon: Padding(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child:   Icon(Icons.camera,size: 33,),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(kDefaultPadding / 2),
            ),
            borderSide: BorderSide(color: Color(0xFFCCCCCC)),
          ),
        ),
      ),
    );
  }
}
