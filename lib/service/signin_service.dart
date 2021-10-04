import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internative_test/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_constants.dart';

class SigninService {
  Future getToken() async {
    var body = jsonEncode({
      "Email": "eren@test.com",
      "Password": "123456",
    });
    final http.Response response = await http.post(Uri.parse(ApiConstants.Singin),
        headers: {
          "accept": "*/*",
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MTI3NTRkZDRhMWMyZDM0NmNmZDk0NmQiLCJmdWxsTmFtZSI6IkVyZW4gS2F5YSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2MzMxMDIyMzgsImV4cCI6MTYzNTY5NDIzOCwiaXNzIjoiaSIsImF1ZCI6ImEifQ.u2voXIQFXzOpPWXApdpHQAZnAbCdHEm63IRwpUInsZU",
          "Content-Type": "application/json"
        },
        body: body);
    if (response.statusCode == 200) {
      var token = jsonDecode(response.body);
      ApiConstants.Token = token["Data"]["Token"];
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }
}
