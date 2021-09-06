import 'package:flutter/material.dart';
import 'package:my_blog/common/models/Blog.dart';
import 'package:my_blog/common/models/blog_list_model.dart';
import 'package:my_blog/common/net/blog_api.dart';
import 'package:my_blog/common/net/http_manager.dart';

import '../../constants.dart';
import '../../responsive.dart';
import 'components/blog_post.dart';
import 'components/categories.dart';
import 'components/recent_posts.dart';
import 'components/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BlogListModel _blogListModel;
  List _categories = [];
  @override
  void initState() {
    super.initState();
    getList();
    getCategories();
  }

  getList() async {
    _blogListModel = await getArticleList();
    setState(() {});
  }

  getCategories() async {
    var jsonData =
        await httpManager.netFetch("api/v1/category", {}, method: "get");
    if (jsonData != null && jsonData["status"] == 200) {
      _categories = jsonData["data"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: List.generate(
              _blogListModel.data.length,
              (index) => BlogPostCard(blog: _blogListModel.data[index]),
            ),
          ),
        ),
        if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
        // Sidebar
        if (!Responsive.isMobile(context))
          Expanded(
            child: Column(
              children: [
                Search(),
                SizedBox(height: kDefaultPadding),
                if (_categories.length > 0) CategoriesWidget(list: _categories),
                SizedBox(height: kDefaultPadding),
                // RecentPosts(),
              ],
            ),
          ),
      ],
    );
  }
}
