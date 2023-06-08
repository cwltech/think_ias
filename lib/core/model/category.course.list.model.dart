// To parse this JSON data, do
//
//     final categoryCourseListModel = categoryCourseListModelFromJson(jsonString);

import 'dart:convert';

CategoryCourseListModel categoryCourseListModelFromJson(String str) =>
    CategoryCourseListModel.fromJson(json.decode(str));

String categoryCourseListModelToJson(CategoryCourseListModel data) =>
    json.encode(data.toJson());

class CategoryCourseListModel {
  String? status;
  String? message;
  Data? data;

  CategoryCourseListModel({
    this.status,
    this.message,
    this.data,
  });

  factory CategoryCourseListModel.fromJson(Map<String, dynamic> json) =>
      CategoryCourseListModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  List<CourseList>? courseList;

  Data({
    this.courseList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        courseList: json["courseList"] == null
            ? []
            : List<CourseList>.from(
                json["courseList"]!.map((x) => CourseList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "courseList": courseList == null
            ? []
            : List<dynamic>.from(courseList!.map((x) => x.toJson())),
      };
}

class CourseList {
  int? id;
  String? courseImage;
  String? course;
  int? priceType;
  String? price;

  CourseList({
    this.id,
    this.courseImage,
    this.course,
    this.priceType,
    this.price,
  });

  factory CourseList.fromJson(Map<String, dynamic> json) => CourseList(
        id: json["id"],
        courseImage: json["course_image"],
        course: json["course"],
        priceType: json["price_type"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "course_image": courseImage,
        "course": course,
        "price_type": priceType,
        "price": price,
      };
}
