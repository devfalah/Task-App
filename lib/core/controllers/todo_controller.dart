import 'package:get/get.dart';
import 'package:tasks/core/controllers/auth_controller.dart';
import 'package:tasks/core/services/todo_service.dart';

import 'package:tasks/models/todo_model.dart';

class TodoController extends GetxController with StateMixin {
  RxBool isDone = false.obs;
  RxList<TodoModel> todos = <TodoModel>[].obs;
  RxString userId = ''.obs;

  TodoController() {
    userId.value = Get.find<AuthController>().user!.uid;
  }

  changedToEmpty() {
    change(todos, status: RxStatus.empty());
  }

  addTodo(TodoModel todo) {
    TodoService().addTaskToFirestore(todo, userId.value);
    todos.insert(0, todo);
    change(todos, status: RxStatus.success());
  }

  updateTodo(TodoModel todo) {
    TodoService().updateTodo(todo, userId.value);
  }

  deleteTodo(TodoModel todo) {
    TodoService().deleteTodoFromFirestore(todo, userId.value);
  }

  getTodos(taskId) async {
    todos.bindStream(
        await TodoService().getTodosFromFirestore(userId.value, taskId));
    change(todos, status: RxStatus.success());
  }
}
