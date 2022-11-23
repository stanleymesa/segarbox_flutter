import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:segarbox_flutter/app/data/models/user.dart';
import 'package:segarbox_flutter/app/modules/allproducts/providers/allproducts_provider.dart';

class AllproductsController extends GetxController {
  final _allProductsProvider = AllProductsProvider();
  final pagingController = PagingController<int, User>(firstPageKey: 1);
  static const _pageSize = 6;

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _allProductsProvider.fetchPage(pageKey, _pageSize);
      final isLastPage =
          (newItems.data != null) ? newItems.data!.length < _pageSize : true;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.data!);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems.data!, nextPageKey);
      }
    } catch (ex) {
      pagingController.error = ex;
    }
  }

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pagingController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() {}
}
