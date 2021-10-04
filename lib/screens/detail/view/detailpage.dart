import 'package:flutter/material.dart';
import 'package:internative_test/model/user.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  Data user;
  DetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName.toString()),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  height: height * 6 / 10,
                  decoration: BoxDecoration(
                      color: Colors.blue[200], borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 15),
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
                        child: Column(
                          children: <Widget>[
                            buildAvatar(user.profilePhoto),
                            buildText(user.fullName.toString(), 18, FontWeight.bold),
                          ],
                        ),
                      ),
                      buildText("E-Mail", 20, FontWeight.bold),
                      buildText(user.email.toString(), 16, FontWeight.w300),
                      buildText("Doğum Günü", 20, FontWeight.bold),
                      buildText(DateFormat('yyyy-MM-dd').format(user.birthDate), 16, FontWeight.w300),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding buildText(String text, double size, FontWeight weight) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Text(
        text,
        style: TextStyle(fontWeight: weight, fontSize: size),
      ),
    );
  }

  Center buildAvatar(String url) {
    return Center(
        child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: url == null
                  ? new Text('No image value.')
                  : Image.network(
                      url,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
            )));
  }
}
