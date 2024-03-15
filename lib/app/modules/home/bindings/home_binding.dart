import 'package:get/get.dart';
import 'package:kt99/app/repository/product_repository.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(ProductRepository(Get.find())),
    );
  }
}
