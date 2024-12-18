import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxdemo/model/product_model.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;
  RxString text = "".obs;

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();

  Rx<ProductModel> productModel = ProductModel().obs;

  // RxList<String> itemList = <String>[].obs;
  RxList<ProductModel> itemList = <ProductModel>[].obs;
  RxList<ProductModel> cartList = <ProductModel>[].obs;
}
