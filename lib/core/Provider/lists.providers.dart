import 'package:flutter/cupertino.dart';
import 'package:think_ias/core/api/lists.of.data.api.dart';
import 'package:think_ias/core/model/category.course.list.model.dart';
import 'package:think_ias/core/model/list.of.data.model.dart';

class ListOfDataProvider with ChangeNotifier {
  final ListsOfDataApi _listsOfDataApi = ListsOfDataApi();
  bool isLoading = false;
  HomeListModel _listData = HomeListModel();

  HomeListModel get listDatas => _listData;

  // Fetch Home List Data Provider
  Future<void> fetchListOfData({required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _listsOfDataApi.getHomeData(context);
      print("Response");
      print("Fetch Home List Data ===========> $response");
      _listData = response!;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  // Fetch Category List Course Data Provider

  CategoryCourseListModel _categoryCourseListModel = CategoryCourseListModel();

  CategoryCourseListModel get categoryListDatas => _categoryCourseListModel;

  Future<void> fetchCategoryListData({required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _listsOfDataApi.getCourseCategoryList(context);
      print("Category List Course Response");
      print("Fetch Course Category List Data ================> $response");
      _categoryCourseListModel = response!;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
