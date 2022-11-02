import 'package:get/get.dart';
import 'package:segarbox_flutter/app/modules/home/controllers/transactions_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<TransactionsController>(
      () => TransactionsController(),
    );
  }
}
