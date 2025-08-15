// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

class TaskModel {
  final String? docId;
  final String? title;
  final String? description;
  final String? image;
  final String? priorityID;
  final String? userID;
  final bool? isCompleted;
  final int? createdAt;

  TaskModel({
    this.docId,
    this.title,
    this.description,
    this.priorityID,
    this.image,
    this.userID,
    this.isCompleted,
    this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    docId: json["docID"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    isCompleted: json["isCompleted"],
    priorityID: json["priorityID"],
    userID: json["userID"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson(String taskID) => {
    "docID": taskID,
    "title": title,
    "description": description,
    "image": image,
    "priorityID": priorityID,
    "isCompleted": isCompleted,
    "userID": userID,
    "createdAt": createdAt,
  };
}
