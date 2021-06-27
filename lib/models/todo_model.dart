import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String? id;
  final String taskId;
  final String title;
  final bool isDone;
  TodoModel({
    this.id,
    required this.taskId,
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'title': title,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromMap(QueryDocumentSnapshot map) {
    return TodoModel(
      id: map.id,
      taskId: map['taskId'] ?? '',
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }
}
