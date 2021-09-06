import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/widget/my_image.dart';
import 'package:my_blog/common/widget/my_super_widget.dart';

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
          width: 1200,
          child: Row(
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: MySuperWidget(
                    bgColor: Colors.purple,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (_, i) {
                        return MySuperWidget(
                          text: "$i. 这是标题水电费收不到你随便",
                          margin: EdgeInsets.all(20),
                          maxLines: 2,
                        );
                      },
                      itemCount: 30,
                      padding: EdgeInsets.only(top: 50),
                    ),
                  ),
                ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: MarkdownBody(data: """
                  
我展示的是一级标题
=================

我展示的是二级标题
-----------------
qisBlank
qisBlank
wisBlanksisBlank
xisBlank


# 一级标题
## 二级标题
### 三级标题
#### 四级标题
##### 五级标题
###### 六级标题 
                  
                  """),
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
