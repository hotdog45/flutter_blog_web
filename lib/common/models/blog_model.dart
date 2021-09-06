// To parse this JSON data, do
//
//     final blogmodel = blogmodelFromJson(jsonString);

import 'dart:convert';

class BlogModel {
  BlogModel({
    required this.category,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.title,
    required this.cid,
    required this.desc,
    required this.content,
    required this.img,
    required this.commentCount,
    required this.readCount,
  });

  Category category;
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  int cid;
  String desc;
  String content;
  String img;
  int commentCount;
  int readCount;

  factory BlogModel.fromRawJson(String str) => BlogModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
    category: Category.fromJson(json["Category"]),
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    title: json["title"],
    cid: json["cid"],
    desc: json["desc"],
    content: json["content"],
    img: json["img"],
    commentCount: json["comment_count"],
    readCount: json["read_count"],
  );

  Map<String, dynamic> toJson() => {
    "Category": category.toJson(),
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "title": title,
    "cid": cid,
    "desc": desc,
    "content": content,
    "img": img,
    "comment_count": commentCount,
    "read_count": readCount,
  };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
