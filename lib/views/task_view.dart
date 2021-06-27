import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/views/widgets/custom_fb.dart';

import '/core/controllers/task_controller.dart';
import '/models/task_model.dart';
import '/views/widgets/todo_list.dart';

class TaskView extends GetView<TaskController> {
  final TaskModel? task;
  TaskView({
    this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 24.0,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller.textEditingController,
                    focusNode: controller.titleFocus,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: task?.title ?? "Enter  task title",
                    ),
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Color(0xFF211551),
                      fontWeight: FontWeight.bold,
                    ),
                    onSubmitted: (value) {
                      if (task != null) {
                        controller.updateTask(
                          TaskModel(
                            title: controller.textEditingController.text,
                            id: task!.id,
                            description: task!.description,
                          ),
                        );
                        controller.descriptionFocus.requestFocus();
                      } else {
                        controller.descriptionFocus.requestFocus();
                      }
                    },
                  ),
                ),
              ],
            ),
            TextField(
              focusNode: controller.descriptionFocus,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText:
                    task?.description ?? "Enter  Description for the task",
                contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
              ),
              style: TextStyle(
                color: Color(0xFF211551),
              ),
              onSubmitted: (value) {
                if (task == null) {
                  controller.createTask(
                    TaskModel(
                      title: controller.textEditingController.text,
                      description: value,
                    ),
                  );
                  Get.back();
                  controller.textEditingController.text = "";
                } else {
                  controller.updateTask(TaskModel(
                    title: controller.textEditingController.text,
                    id: task!.id,
                    description: value,
                  ));
                  controller.textEditingController.text = "";
                }
              },
            ),
            SizedBox(height: 32),
            TodosList(taskId: task?.id),
          ],
        ),
      )),
      floatingActionButton: CustomFloatingActionButton(
        color: Color(0xFFFE35777),
        icon: Icons.delete,
        onTap: () {
          if (task != null) {
            controller.deleteTask(task!);
            Get.back();
          }
          Get.back();
        },
      ),
    );
  }
}
