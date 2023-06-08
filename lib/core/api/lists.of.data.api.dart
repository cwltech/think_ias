import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:think_ias/core/model/list.of.data.model.dart';

import '../model/category.course.list.model.dart';
import '../utils/snackbar.util.dart';

class ListsOfDataApi {
  final client = http.Client();
  final header = {'Content-Type': 'application/json'};

  //  Fetch Home Data List API
  Future<HomeListModel?> getHomeData(context) async {
    const subUrl = "https://cwltechnology.in/think-ias/ApiController/home";
    try {
      final Uri uri = Uri.parse(subUrl);
      final http.Response response = await client.post(uri, headers: header);
      print("From Repo");
      print("Home List Of Course (CODE) =============> ${response.statusCode}");
      print("Home List Of Course (JSON) =============>${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return HomeListModel.fromJson(data);
        // return result;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: "Something Went Wrong", context: context));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Fetch Course List Category List
  Future<CategoryCourseListModel?> getCourseCategoryList(
      BuildContext context) async {
    const subUrl =
        "https://cwltechnology.in/think-ias/ApiController/courseList";
    try {
      final Uri uri = Uri.parse(subUrl);
      final http.Response response = await client.post(uri, headers: header);
      print("Category Repo Data");
      print(
          "Category Course List Data (CODE)==========> ${response.statusCode}");
      print("Category Course List (JSON) =============> ${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return CategoryCourseListModel.fromJson(data);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: "Something Went Wrong", context: context));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
