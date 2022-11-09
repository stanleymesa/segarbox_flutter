import 'package:get/get.dart';
import 'package:segarbox_flutter/app/data/models/user.dart';

class HomeProvider extends GetConnect {
  Future<User> fetchUsers() async {
    final response = await get('https://reqres.in/api/users?page=1');

    if (response.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return userFromJson(response.bodyString!);
    }
  }
}
