import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_blog/common/models/Blog.dart';
import 'package:my_blog/common/models/blog_model.dart';
import 'package:my_blog/common/utils/date_time_utils.dart';
import 'package:my_blog/page/details/article_details_page.dart';
import 'package:my_blog/common/widget/my_image.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class BlogPostCard extends StatelessWidget {
  final BlogModel blog;
  const BlogPostCard({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ArticleDetailsPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: kDefaultPadding),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.78,
              child: MyImage(blog.img),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        blog.category.name,
                        style: TextStyle(
                          color: kDarkBlackColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: kDefaultPadding),
                      Text(
                        DateTimeUtils.dateFormatByTime(blog.createdAt),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(
                      blog.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Responsive.isDesktop(context) ? 32 : 24,
                        fontFamily: "Raleway",
                        color: kDarkBlackColor,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    blog.desc,
                    maxLines: 4,
                    style: TextStyle(height: 1.5),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.only(bottom: kDefaultPadding / 4),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: kPrimaryColor, width: 3),
                            ),
                          ),
                          child: Text(
                            "Read More",
                            style: TextStyle(color: kDarkBlackColor),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.camera,
                          size: 33,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.camera,
                          size: 33,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.camera,
                          size: 33,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
