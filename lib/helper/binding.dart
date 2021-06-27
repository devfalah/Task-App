import 'package:get/get.dart';
import 'package:tasks/core/controllers/controllers.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => TaskController(), fenix: true);
    Get.lazyPut(() => TodoController(), fenix: true);
  }
}
