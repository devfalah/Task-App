import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String? title;
  final String? description;
  TaskModel({
    this.id,
    this.title,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory TaskModel.fromMap(QueryDocumentSnapshot map) {
    return TaskModel(
      id: map.id,
      title: map['title'],
      description: map['description'],
    );
  }
}
