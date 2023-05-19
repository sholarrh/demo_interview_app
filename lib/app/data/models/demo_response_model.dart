// To parse this JSON data, do
//
//     final demoResponseModel = demoResponseModelFromJson(jsonString);

import 'dart:convert';

List<DemoResponseModel> demoResponseModelFromJson(String str) => List<DemoResponseModel>.from(json.decode(str).map((x) => DemoResponseModel.fromJson(x)));

String demoResponseModelToJson(List<DemoResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DemoResponseModel {
  int? userId;
  int? id;
  String? title;

  DemoResponseModel({
    this.userId,
    this.id,
    this.title,
  });

  factory DemoResponseModel.fromJson(Map<String, dynamic> json) => DemoResponseModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
