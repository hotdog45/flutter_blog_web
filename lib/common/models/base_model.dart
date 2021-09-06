import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  BaseModel({
    this.total,
    required this.status,
    this.msg,
    this.data,
  });

  int status;
  String? msg;
  dynamic data;
  int? total;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        total: json["total"],
        status: json["status"],
        msg: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "status": status,
        "msg": msg,
        "data": data,
      };
}
