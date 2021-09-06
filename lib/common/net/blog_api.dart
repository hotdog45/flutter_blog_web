import 'package:get/get.dart';
import 'package:my_blog/common/models/blog_list_model.dart';
import 'package:my_blog/common/models/blog_model.dart';
import 'package:my_blog/config/config.dart';

import 'http_manager.dart';

final String _articleList = 'api/v1/article';
final String _categoryList = 'api/v1/category';

//文章列表
Future<BlogListModel> getArticleList({int page = 1}) async {
  var jsonData = await httpManager.netFetch(
      _articleList + "?pagesize=${Config.PAGE_SIZE}&pagenum=$page", {},
      method: "get");

  BlogListModel model = BlogListModel.fromJson(jsonData);
  return model;
}

