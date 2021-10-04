import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_test/model/user.dart';
import 'package:internative_test/screens/detail/view/detailpage.dart';
import 'package:internative_test/screens/home/viewmodel/homepage_view_model.dart';
import 'package:internative_test/service/addfriend.dart';
import 'package:internative_test/service/removefriend.dart';

class HomePage extends StatelessWidget {
  HomePageViewModel _viewModel = HomePageViewModel();
  AddFriendService addfriend = AddFriendService();
  RemoveFriend remove = RemoveFriend();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İnternative"),
      ),
      body: Observer(
        builder: (_) {
          return _viewModel.isServiseReuquestLoading ? buildCircularProgressIndicator() : BuildCard(_viewModel.datas);
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: Text("VB10"),
        leading: Observer(builder: (_) {
          return Visibility(
            visible: _viewModel.isServiseReuquestLoading,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        }));
  }

  GestureDetector BuildCard(List<Data> snapshot) {
    return GestureDetector(
      onTap: () {},
      child: Observer(builder: (_) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.length,
          itemBuilder: (BuildContext context, int index) {
            List<Data> _data = snapshot;
            _viewModel.getButtonText(_data[index].id);
            _viewModel.getIcon(_data[index].id);
            return InkWell(
              onTap: () {},
              child: Card(
                  child: ListTile(
                title: Text(
                  _data[index].firstName,
                ),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: _data[index].profilePhoto == null
                        ? new Text('No image value.')
                        : Image.network(
                            _data[index].profilePhoto,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                subtitle: Text(
                  _data[index].lastName,
                ),
                trailing: TextButton.icon(onPressed: () {
                  if (_viewModel.buttonText[index] == "Ekle") {
                    addfriend.addFriend(_data[index].id);
                  } else {
                    remove.removeFriend(_data[index].id);
                  }
                  _viewModel.reverseButtonText(_viewModel.buttonText[index], index);
                  _viewModel.reverseIcon(_viewModel.icons[index], index);
                }, icon: Observer(builder: (_) {
                  return Icon(_viewModel.icons[index]);
                }), label: Observer(builder: (_) {
                  return Text(_viewModel.buttonText[index]);
                })),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(user: _data[index]))),
              )),
            );
          },
        );
      }),
    );
  }

  CircularProgressIndicator buildCircularProgressIndicator() => CircularProgressIndicator();
}
