import 'package:get/get.dart';

import '../controllers/allproducts_controller.dart';

class AllproductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllproductsController>(
      () => AllproductsController(),
    );
  }
}
