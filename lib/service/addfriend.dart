import 'dart:convert';
import 'package:http/http.dart' as http;

import 'api_constants.dart';

class AddFriendService {
  Future addFriend(String? id) async {
    var body = jsonEncode({"UserId": "$id"});

    Map<String, String> headers = {"accept": "*/*", "Authorization": "Bearer ${ApiConstants.Token}", "Content-Type": "application/json"};

    final http.Response response = await http.post(Uri.parse(ApiConstants.AddToFriends), headers: headers, body: body);

    if (response.statusCode == 200) {
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }
}
