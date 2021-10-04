import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internative_test/model/user.dart';
import 'package:internative_test/service/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'homepage_view_model.g.dart';

class HomePageViewModel = _HomePageViewModelBase with _$HomePageViewModel;

abstract class _HomePageViewModelBase with Store {
  @observable
  List<Data> datas = [];

  @observable
  List<User> user = [];

  @observable
  int currentIndex = 0;

  @observable
  var buttonText = ObservableList<String>.of([]);
  @observable
  var icons = ObservableList<IconData>.of([]);

  @observable
  ObservableFuture<List<Data>>? datalar;

  @observable
  PageState pageState = PageState.NORMAL;

  @observable
  bool isServiseReuquestLoading = true;

  Future getUsers() async {
    List<Data> datas = [];
    Map<String, String> headers = {"accept": "*/*", "Authorization": "Bearer ${ApiConstants.Token}"};
    final http.Response response = await http.get(Uri.parse(ApiConstants.GetUsers), headers: headers);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      res = res['Data'];
      for (var u in res) {
        Data data = Data.fromJson(u);
        datas.add(data);
      }
    }
    changeRequest();
    return datas;
  }

  Future<User> fetchData() async {
    Map<String, String> headers = {"accept": "*/*", "Authorization": "Bearer ${ApiConstants.Token}"};
    final http.Response response = await http.get(Uri.parse(ApiConstants.GetAccount), headers: headers);
    if (response.statusCode == 200) {
      final _jsonResponse = User.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }

  _HomePageViewModelBase() {
    fetchDatas();
  }
  @action
  void changeRequest() {
    isServiseReuquestLoading = !isServiseReuquestLoading;
  }

  @action
  Future<void> fetchDatas() async {
    user.add(await fetchData());
    datas = await getUsers();
  }

  @action
  void getButtonText(String? Id) {
    bool anyFriend = false;
    for (var i = 0; i < 2; i++) {
      if (user[0].data!.friendIds![i] == Id) {
        anyFriend = true;
      }
    }
    if (anyFriend)
      buttonText.add("Çıkar");
    else
      buttonText.add("Ekle");
  }

  @action
  void reverseButtonText(String? buttonTxt, int index) {
    buttonText[index] = buttonTxt == "Çıkar" ? "Ekle" : "Çıkar";
  }

  @action
  void reverseIcon(IconData icon, int index) {
    if (icon == Icons.person_remove_alt_1_outlined) {
      icons[index] = Icons.person_add_alt_1_outlined;
    } else {
      icons[index] = Icons.person_remove_alt_1_outlined;
    }
  }

  @action
  void getIcon(String? id) {
    bool anyFriend = false;

    for (var i = 0; i < 2; i++) {
      if (user[0].data!.friendIds![i] == id) {
        anyFriend = true;
      }
    }
    if (anyFriend)
      icons.add(Icons.person_remove_alt_1_outlined);
    else
      icons.add(Icons.person_add_alt_1_outlined);
  }
}

enum PageState { LOADING, ERROR, SUCCESS, NORMAL }
