import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/widget/my_image.dart';
import 'package:my_blog/widget/my_super_widget.dart';

import '../../responsive.dart';

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({Key? key}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1600,
          child: Row(
            children: [

              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: MySuperWidget(
                    bgColor: Colors.purple,
                    height: 1000,
                  ),
                ),
              Expanded(
                flex: 6,
                child: ListView(
                  children: [
                    Container(
                      width: 500,
                      height: 100,
                      color: Colors.lightBlue,
                    ),
                    Container(
                      width: 600,
                      height: 200,
                      color: Colors.purpleAccent,
                    ),
                    MyImage(
                      "",
                      width: 600,
                      height: 800,
                    ),
                    Container(
                      width: 500,
                      height: 300,
                      color: Colors.lightBlue,
                    ),
                    MyImage(
                      "",
                      width: 600,
                      height: 800,
                    ),
                    MyImage(
                      "",
                      width: 900,
                      height: 1200,
                    ),
                    Container(
                      width: 500,
                      height: 300,
                      color: Colors.lightBlue,
                    ),
                    MyImage(
                      "",
                      width: 600,
                      height: 800,
                    ),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context))
                Expanded(
                    flex: 2,
                    child: MySuperWidget(
                      bgColor: Colors.amber,
                      height: 1000,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
