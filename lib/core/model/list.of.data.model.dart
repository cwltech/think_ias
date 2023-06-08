// To parse this JSON data, do
//
//     final homeListModel = homeListModelFromJson(jsonString);

import 'dart:convert';

HomeListModel homeListModelFromJson(String str) =>
    HomeListModel.fromJson(json.decode(str));

String homeListModelToJson(HomeListModel data) => json.encode(data.toJson());

class HomeListModel {
  String? status;
  String? message;
  Data? data;

  HomeListModel({
    this.status,
    this.message,
    this.data,
  });

  factory HomeListModel.fromJson(Map<String, dynamic> json) => HomeListModel(
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
  List<BannerList>? bannerList;
  List<CategoryList>? categoryList;
  List<CourseList>? popularCourseList;
  List<CourseList>? featuredCourseList;

  Data({
    this.bannerList,
    this.categoryList,
    this.popularCourseList,
    this.featuredCourseList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannerList: json["bannerList"] == null
            ? []
            : List<BannerList>.from(
                json["bannerList"]!.map((x) => BannerList.fromJson(x))),
        categoryList: json["categoryList"] == null
            ? []
            : List<CategoryList>.from(
                json["categoryList"]!.map((x) => CategoryList.fromJson(x))),
        popularCourseList: json["popularCourseList"] == null
            ? []
            : List<CourseList>.from(
                json["popularCourseList"]!.map((x) => CourseList.fromJson(x))),
        featuredCourseList: json["featuredCourseList"] == null
            ? []
            : List<CourseList>.from(
                json["featuredCourseList"]!.map((x) => CourseList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bannerList": bannerList == null
            ? []
            : List<dynamic>.from(bannerList!.map((x) => x.toJson())),
        "categoryList": categoryList == null
            ? []
            : List<dynamic>.from(categoryList!.map((x) => x.toJson())),
        "popularCourseList": popularCourseList == null
            ? []
            : List<dynamic>.from(popularCourseList!.map((x) => x.toJson())),
        "featuredCourseList": featuredCourseList == null
            ? []
            : List<dynamic>.from(featuredCourseList!.map((x) => x.toJson())),
      };
}

class BannerList {
  int? id;
  String? banner;

  BannerList({
    this.id,
    this.banner,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        id: json["id"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "banner": banner,
      };
}

class CategoryList {
  int? id;
  String? categoryImage;
  String? category;

  CategoryList({
    this.id,
    this.categoryImage,
    this.category,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        categoryImage: json["category_image"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_image": categoryImage,
        "category": category,
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
