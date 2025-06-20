import 'package:happy_tech_mastering_api_with_flutter/core/api/end_ponits.dart';

class PostModel {
  final int id;
  final String title;
  final String content;

  final String first_name;
  final String last_name;

  PostModel({
    required this.first_name,
    required this.last_name,
    required this.id,
    required this.title,
    required this.content,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['post']['title'],
      content: json['post']['content'],
      first_name: json['first_name'],
      last_name: json['last_name'],
    );
  }
}
