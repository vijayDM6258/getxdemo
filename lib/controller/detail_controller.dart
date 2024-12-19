import 'package:get/get.dart';
import 'package:getxdemo/view/detail_page.dart';

import '../model/product_model.dart';

class DetailPageController extends GetxController {
  RxInt count = 0.obs;
  ProductModel? productModel;
  @override
  void onInit() {
    productModel = Get.arguments;
    print("data ${productModel}");
    super.onInit();
  }
}
