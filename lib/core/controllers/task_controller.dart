import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/core/services/task_service.dart';
import 'package:tasks/models/task_model.dart';

import 'auth_controller.dart';

class TaskController extends GetxController with StateMixin {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  RxString userId = ''.obs;
  RxString? userName = ''.obs;
  TextEditingController textEditingController = TextEditingController();
  FocusNode titleFocus = FocusNode();
  FocusNode descriptionFocus = FocusNode();
  final hour = DateTime.now().hour;

  @override
  Future<void> onInit() async {
    userId.value = Get.find<AuthController>().user!.uid;
    userName!.value = Get.find<AuthController>().user!.displayName ??
        Get.find<AuthController>().user!.email!.substring(0, 10).toString();

    getTasks();

    super.onInit();
  }

  getTasks() async {
    tasks.bindStream(await TaskService().getTasksFromFirestore(userId.value));
    change(tasks, status: RxStatus.success());
  }

  createTask(TaskModel task) {
    TaskService().addTaskToFirestore(task, userId.value);
    change(tasks, status: RxStatus.success());
  }

  getTaskById(taskId) {
    TaskService().getTaskFromId(taskId, userId.value);
  }

  updateTask(TaskModel task) {
    TaskService().updateTask(task, userId.value);
    change(tasks);
  }

  deleteTask(TaskModel task) {
    TaskService().deleteTaskFromFirestore(task, userId.value);
    change(tasks);
    if (tasks.length == 1) {
      change(tasks, status: RxStatus.empty());
      Get.delete<TaskController>();
    }
  }
}
