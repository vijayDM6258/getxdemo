import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;
  RxString text = "".obs;
  RxList<String> itemList = <String>[].obs;
}
