// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });
  List<dynamic>? validationErrors;
  bool? hasError;
  dynamic message;
  Data? data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        validationErrors: List<dynamic>.from(json["ValidationErrors"].map((x) => x)),
        hasError: json["HasError"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
      );

  Map<String, dynamic> toJson() => {
        "ValidationErrors": List<dynamic>.from(validationErrors!.map((x) => x)),
        "HasError": hasError,
        "Message": message,
        "Data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    required this.firstName,
    required this.lastName,
    this.fullName,
    this.email,
    required this.birthDate,
    required this.profilePhoto,
    this.friendIds,
  });

  String? id;
  String firstName;
  String lastName;
  String? fullName;
  String? email;
  DateTime birthDate;
  String profilePhoto;
  List<String>? friendIds;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["Id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        fullName: json["FullName"],
        email: json["Email"],
        birthDate: DateTime.parse(json["BirthDate"]),
        profilePhoto: json["ProfilePhoto"],
        friendIds: List<String>.from(json["FriendIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "FullName": fullName,
        "Email": email,
        "BirthDate": birthDate.toIso8601String(),
        "ProfilePhoto": profilePhoto,
        "FriendIds": List<dynamic>.from(friendIds!.map((x) => x)),
      };
}
