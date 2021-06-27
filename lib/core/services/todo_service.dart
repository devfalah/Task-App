import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/models/todo_model.dart';

class TodoService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  addTaskToFirestore(TodoModel todo, userId) {
    users
        .doc(userId)
        .collection('Tasks')
        .doc(todo.taskId)
        .collection('todos')
        .doc()
        .set(todo.toMap());
  }

  updateTodo(TodoModel todo, userId) {
    users
        .doc(userId)
        .collection('Tasks')
        .doc(todo.taskId)
        .collection('todos')
        .doc(todo.id)
        .update(todo.toMap());
  }

  deleteTodoFromFirestore(TodoModel todo, userId) {
    users
        .doc(userId)
        .collection('Tasks')
        .doc(todo.taskId)
        .collection('todos')
        .doc(todo.id)
        .delete();
  }

  Future<Stream<List<TodoModel>>> getTodosFromFirestore(userId, taskId) async {
    return users
        .doc(userId)
        .collection('Tasks')
        .doc(taskId)
        .collection('todos')
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => TodoModel.fromMap(e),
              )
              .toList(),
        );
  }
}
