// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyProjectsModel {
  String? title;
  String? workingType;
  String? workingPlace;
  String? desciption;
  String? imagePath;
  bool? private;
  String? googlplayLink;
  String? appStoreLink;
  Widget? features;
  List<String>? technology;
  MyProjectsModel({
    this.title,
    this.desciption,
    this.workingType,
    this.imagePath,
    this.workingPlace,
    this.private,
    this.googlplayLink,
    this.features,
    this.appStoreLink,
    this.technology,
  });
}
