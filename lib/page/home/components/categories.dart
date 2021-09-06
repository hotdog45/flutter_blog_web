import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'sidebar_container.dart';

class CategoriesWidget extends StatelessWidget {
  final List list;

  const CategoriesWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SidebarContainer(
      title: "分类",
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, i) {
          return CategoryWidget(
            title: list[i]["name"],
            numOfItems: 0,
            press: () {},
          );
        },
        itemCount: list.length,
        padding: EdgeInsets.only(top: 30,bottom: 30),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String title;
  final int numOfItems;
  final VoidCallback press;
  const CategoryWidget({
    Key? key,
    required this.title,
    required this.numOfItems,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
      child: TextButton(
        onPressed: () {},
        child: Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(color: kDarkBlackColor),
            children: [
              TextSpan(
                text: "",
                style: TextStyle(color: kBodyTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
