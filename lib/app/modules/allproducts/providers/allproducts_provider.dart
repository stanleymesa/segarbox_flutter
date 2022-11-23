import 'package:get/get.dart';
import 'package:segarbox_flutter/app/data/models/user.dart';

class AllProductsProvider extends GetConnect {
  Future<UserResponse> fetchPage(int page, int size) async {
    final response =
        await get('https://reqres.in/api/users?page=${page}&per_page=${size}');

    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return userFromJson(response.bodyString!);
    }
  }
}
