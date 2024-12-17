import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxdemo/controller/home_controller.dart';

class DetailPage extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();

  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return ListView.builder(
          itemCount: homeController.itemList.length,
          itemBuilder: (context, index) {
            var item = homeController.itemList[index];
            return ListTile(
              title: Text("$item"),
              trailing: IconButton(
                  onPressed: () {
                    homeController.itemList.removeAt(index);
                  },
                  icon: Icon(Icons.delete)),
            );
          },
        );
      }),
    );
  }
}
