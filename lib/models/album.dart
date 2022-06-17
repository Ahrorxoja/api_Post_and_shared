// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  Album({
    required this.success,
    required this.code,
    required this.message,
  });

  bool success;
  int code;
  String message;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
    success: json["success"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "code": code,
    "message": message,
  };
}
