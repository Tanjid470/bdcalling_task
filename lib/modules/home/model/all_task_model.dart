
import 'dart:convert';

AllTaskModel allTaskModelFromJson(String str) => AllTaskModel.fromJson(json.decode(str));

String allTaskModelToJson(AllTaskModel data) => json.encode(data.toJson());


class AllTaskModel {
  String? status;
  String? message;
  Data? data;

  AllTaskModel({this.status, this.message, this.data});

  AllTaskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? count;
  List<MyTasks>? myTasks;

  Data({this.count, this.myTasks});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['myTasks'] != null) {
      myTasks = <MyTasks>[];
      json['myTasks'].forEach((v) {
        myTasks!.add( MyTasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (myTasks != null) {
      data['myTasks'] = myTasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyTasks {
  String? sId;
  String? title;
  String? description;
  String? creatorEmail;
  String? createdAt;
  String? updatedAt;
  int? iV;

  MyTasks(
      {this.sId,
        this.title,
        this.description,
        this.creatorEmail,
        this.createdAt,
        this.updatedAt,
        this.iV});

  MyTasks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    creatorEmail = json['creator_email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['creator_email'] = creatorEmail;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
