import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/models/blog_model.dart';
import 'package:my_blog/common/net/http_manager.dart';
import 'package:my_blog/common/widget/my_image.dart';
import 'package:my_blog/common/widget/my_super_widget.dart';
import 'package:html2md/html2md.dart' as html2md;

import '../../responsive.dart';

class ArticleDetailsPage extends StatefulWidget {
  final String id;

  const ArticleDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  BlogModel? blogModel ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); //article/info/
    getArticleInfo();
  }

  //
  getArticleInfo() async {
    var jsonData = await httpManager
        .netFetch("api/v1/article/info/${widget.id}", {}, method: "get");
    if (jsonData != null && jsonData["status"] == 200) {
      blogModel = BlogModel.fromJson(jsonData["data"]);
      setState(() {});
    }
  }

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
                  child:blogModel == null ? Container(): ListView(children: [
                    MarkdownBody(
                      data: html2md.convert(blogModel!.content),
                      shrinkWrap: true,
                    )
                  ]),
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
