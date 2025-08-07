// To parse this JSON data, do
//
//     final priorityModel = priorityModelFromJson(jsonString);

import 'dart:convert';

PriorityModel priorityModelFromJson(String str) => PriorityModel.fromJson(json.decode(str));


class PriorityModel {
  final String? docId;
  final String? name;
  final int? createdAt;

  PriorityModel({
    this.docId,
    this.name,
    this.createdAt,
  });

  factory PriorityModel.fromJson(Map<String, dynamic> json) => PriorityModel(
    docId: json["docID"],
    name: json["name"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson(String docID) => {
    "docID": docID,
    "name": name,
    "createdAt": createdAt,
  };
}
