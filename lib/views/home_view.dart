import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks/core/controllers/controllers.dart';
import 'package:tasks/views/profile_view.dart';
import 'package:tasks/views/widgets/custom_fb.dart';

import '/helper/constance.dart';
import '/views/task_view.dart';
import '/views/widgets/task_card.dart';

class HomeView extends GetView<TaskController> {
  final todoController = Get.find<TodoController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 32.0,
            ),
            child: Column(
              children: [
                header(),
                SizedBox(height: 32),
                controller.obx(
                  (state) => Obx(
                    () => controller.tasks.isEmpty
                        ? TaskCard(
                            title: "Get Started",
                            desc:
                                "Hello ${controller.userName!.value} ! Welcome to tasks app , this is a default task that you can edit or delete to start using the app",
                          )
                        : buildTasksList(),
                  ),
                  onLoading: Center(child: CircularProgressIndicator()),
                  onEmpty: TaskCard(
                    title: "Get Started",
                    desc:
                        "Hello ${controller.userName!.value}  Welcome to tasks app name , this is a default task that you can edit or delete to start using the app",
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: CustomFloatingActionButton(
        color: mainColor,
        icon: Icons.add,
        onTap: () {
          todoController.changedToEmpty();
          Get.to(
            () => TaskView(),
            transition: Transition.downToUp,
            duration: Duration(milliseconds: 600),
          );
        },
      ),
    );
  }

  Widget buildTasksList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.tasks.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: TaskCard(
            title: controller.tasks[index].title,
            desc: controller.tasks[index].description,
          ),
          onTap: () {
            todoController.getTodos(controller.tasks[index].id);
            Get.to(
              () => TaskView(task: controller.tasks[index]),
              transition: Transition.downToUp,
              duration: Duration(milliseconds: 600),
            );
          },
        ),
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/logo.png"),
        Text(
          controller.hour > 12 ? "Good evening" : "Good morning",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.to(ProfileView());
          },
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              authController.user!.photoURL ?? personPlaceholderImage,
            ),
            radius: 30.0,
          ),
        ),
      ],
    );
  }
}
