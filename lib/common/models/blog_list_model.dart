import 'dart:convert';

import 'blog_model.dart';

class BlogListModel {
  BlogListModel({
    required this.data,
    this.message,
    required this.status,
    required this.total,
  });

  List<BlogModel> data;
  String? message;
  int status;
  int total;

  factory BlogListModel.fromRawJson(String str) => BlogListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogListModel.fromJson(Map<String, dynamic> json) => BlogListModel(
    data: List<BlogModel>.from(json["data"].map((x) => BlogModel.fromJson(x))),
    message: json["message"],
    status: json["status"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
    "status": status,
    "total": total,
  };
}