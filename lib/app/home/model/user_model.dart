// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String typename;
  final List<GetUserProfile> getUserProfile;

  UserModel({
    required this.typename,
    required this.getUserProfile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        typename: json["__typename"],
        getUserProfile: List<GetUserProfile>.from(
            json["get_user_profile"].map((x) => GetUserProfile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "get_user_profile":
            List<dynamic>.from(getUserProfile.map((x) => x.toJson())),
      };
}

class GetUserProfile {
  final String typename;
  final int userId;
  final DateTime updatedAt;
  final int subdivisionId;
  final String position;
  final String phoneNumber;
  final LocationJson locationJson;
  final String lastName;
  final int id;
  final String firstName;
  final String fatherName;
  final DateTime createdAt;
  final User user;

  GetUserProfile({
    required this.typename,
    required this.userId,
    required this.updatedAt,
    required this.subdivisionId,
    required this.position,
    required this.phoneNumber,
    required this.locationJson,
    required this.lastName,
    required this.id,
    required this.firstName,
    required this.fatherName,
    required this.createdAt,
    required this.user,
  });

  factory GetUserProfile.fromJson(Map<String, dynamic> json) => GetUserProfile(
        typename: json["__typename"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        subdivisionId: json["subdivision_id"],
        position: json["position"],
        phoneNumber: json["phone_number"],
        locationJson: LocationJson.fromJson(json["location_json"]),
        lastName: json["last_name"],
        id: json["id"],
        firstName: json["first_name"],
        fatherName: json["father_name"],
        createdAt: DateTime.parse(json["created_at"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "subdivision_id": subdivisionId,
        "position": position,
        "phone_number": phoneNumber,
        "location_json": locationJson.toJson(),
        "last_name": lastName,
        "id": id,
        "first_name": firstName,
        "father_name": fatherName,
        "created_at": createdAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class LocationJson {
  LocationJson();

  factory LocationJson.fromJson(Map<String, dynamic> json) => LocationJson();

  Map<String, dynamic> toJson() => {};
}

class User {
  final String typename;
  final String role;
  final dynamic car;

  User({
    required this.typename,
    required this.role,
    required this.car,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        typename: json["__typename"],
        role: json["role"],
        car: json["car"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "role": role,
        "car": car,
      };
}
