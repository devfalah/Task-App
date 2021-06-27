import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/models/task_model.dart';

class TaskService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  addTaskToFirestore(TaskModel model, userId) async {
    users.doc(userId).collection('Tasks').doc().set(model.toMap());
  }

  updateTask(TaskModel model, userId) {
    users.doc(userId).collection('Tasks').doc(model.id).update(model.toMap());
  }

  deleteTaskFromFirestore(TaskModel model, userId) {
    users.doc(userId).collection('Tasks').doc(model.id).delete();
  }

  getTaskFromId(String taskId, userId) {
    users.doc(userId).collection('Tasks').doc(taskId)
      ..snapshots().map(
        (event) => TaskModel(
          id: event.id,
          title: event.get('title'),
          description: event.get('description'),
        ),
      );
  }

  Future<Stream<List<TaskModel>>> getTasksFromFirestore(userId) async {
    return users.doc(userId).collection('Tasks').snapshots().map(
          (event) => event.docs
              .map(
                (e) => TaskModel.fromMap(e),
              )
              .toList(),
        );
  }
}
