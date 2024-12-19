import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxdemo/controller/detail_controller.dart';
import 'package:getxdemo/controller/home_controller.dart';

class DetailPage extends StatelessWidget {
  DetailPageController controller = Get.put(DetailPageController());

  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(() {
            //   return Text("test1");
            // }),
            // GetX<DetailPageController>(
            //   init: DetailPageController(),
            //   initState: (_) {},
            //   builder: (logic) {
            //     return Text("test2 ${logic.count}");
            //   },
            // ),
            // GetBuilder<DetailPageController>(
            //   builder: (logic) {
            //     return Text("test3 ${logic.count}");
            //   },
            // ),
            ElevatedButton(
                onPressed: () {
                  DetailPageController controller = Get.find<DetailPageController>();
                  controller.update();
                },
                child: Text("Update")),
            Text(
              "Product : ${controller.productModel?.name}",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "price : ${controller.productModel?.price}",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DetailPageController controller = Get.find<DetailPageController>();
          controller.count++;
        },
      ),
    );
  }
}
