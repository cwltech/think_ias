import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:think_ias/core/model/list.of.data.model.dart';

import '../utils/snackbar.util.dart';

class ListsOfDataApi {
  final client = http.Client();
  final header = {'Content-Type': 'application/json'};

  //  Fetch Home Data List API
  Future<HomeListModel?> getHomeData(context) async {
    HomeListModel result;
    const subUrl = "https://cwltechnology.in/think-ias/ApiController/home";
    try {
      final Uri uri = Uri.parse(subUrl);
      final http.Response response = await client.post(uri, headers: header);
      print("From Repo");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return HomeListModel.fromJson(data);
        // return result;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
            text: "Check You Connection", context: context));
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
