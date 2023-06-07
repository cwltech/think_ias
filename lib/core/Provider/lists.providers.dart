import 'package:flutter/cupertino.dart';
import 'package:think_ias/core/api/lists.of.data.api.dart';
import 'package:think_ias/core/model/list.of.data.model.dart';

class ListOfDataProvider with ChangeNotifier {
  final ListsOfDataApi _listsOfDataApi = ListsOfDataApi();
  bool isLoading = false;
  HomeListModel _listData = HomeListModel();

  HomeListModel get listDatas => _listData;

  Future<void> fetchListOfData({required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _listsOfDataApi.getHomeData(context);
      print("Response");
      print(response);
      _listData = response!;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
