import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/controllers/todo_controller.dart';
import '/helper/constance.dart';
import '/models/todo_model.dart';
import '/views/widgets/todo_card.dart';

class TodosList extends GetView<TodoController> {
  final String? taskId;
  TodosList({
    this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Obx(
        () => Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: controller.todos.length + 1,
            itemBuilder: (BuildContext context, int index) {
              print(controller.todos.length);
              if (index == 0) {
                return addTodoCard(controller);
              } else if (index < controller.todos.length + 1 &&
                  controller.todos.isNotEmpty) {
                return TodoCard(
                  title: controller.todos[index - 1].title,
                  isDone: controller.todos[index - 1].isDone,
                  onChanged: (value) {
                    controller.updateTodo(
                      TodoModel(
                        taskId: taskId!,
                        title: controller.todos[index - 1].title,
                        isDone: value!,
                        id: controller.todos[index - 1].id,
                      ),
                    );
                  },
                  onLongPress: () {
                    controller.deleteTodo(
                      TodoModel(
                        taskId: taskId!,
                        title: controller.todos[index - 1].title,
                        isDone: controller.todos[index - 1].isDone,
                        id: controller.todos[index - 1].id,
                      ),
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget addTodoCard(controller) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            child: Checkbox(
              activeColor: mainColor,
              value: controller.isDone.value,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter  todo for the task",
                contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
              ),
              style: TextStyle(
                color: Color(0xFF211551),
              ),
              onSubmitted: (value) {
                print(taskId);
                controller.addTodo(
                  TodoModel(taskId: taskId!, title: value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
