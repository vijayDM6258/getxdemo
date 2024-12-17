import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxdemo/controller/home_controller.dart';
import 'package:getxdemo/view/detail_page.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              controller.text.value = value;
            },
            onFieldSubmitted: (value) {
              controller.itemList.add(value);
            },
          ),
          Center(
            child: Obx(() => Text("Count is ${controller.count}")),
          ),
          Obx(() {
            return Text("==> ${controller.text} <==");
          }),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.itemList.length,
                itemBuilder: (context, index) {
                  var item = controller.itemList[index];
                  return ListTile(
                    title: Text("$item"),
                    trailing: IconButton(
                        onPressed: () {
                          controller.itemList.removeAt(index);
                        },
                        icon: Icon(Icons.delete)),
                  );
                },
              );
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.count++;
          Get.to(() => DetailPage());
        },
      ),
    );
  }
}
