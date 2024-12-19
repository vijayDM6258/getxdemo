import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxdemo/controller/home_controller.dart';
import 'package:getxdemo/model/product_model.dart';
import 'package:getxdemo/view/cart_page.dart';
import 'package:getxdemo/view/detail_page.dart';

class HomePage extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              label: Obx(() {
                return Text("${controller.cartList.length}");
              }),
              isLabelVisible: controller.cartList.isNotEmpty,
              child: IconButton(
                onPressed: () {
                  // Get.to(CartPage());
                  Get.toNamed("CartPage");
                  // Get.back();
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
              icon: Icon(Icons.light))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.name,
                  onChanged: (value) {
                    controller.text.value = value;
                  },
                  decoration: InputDecoration(hintText: "Product Name"),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: controller.price,
                  onChanged: (value) {
                    controller.text.value = value;
                  },
                  decoration: InputDecoration(hintText: "Product Price"),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                controller.itemList.add(ProductModel(
                  name: controller.name.text,
                  price: double.tryParse(controller.price.text),
                ));
                controller.name.clear();
                controller.price.clear();
              },
              child: Text("Add Product")),
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
                  ProductModel item = controller.itemList[index];
                  return ListTile(
                    title: Text("${item.name}"),
                    subtitle: Text("\$${item.price}"),
                    onTap: () {
                      Get.to(() => DetailPage(), arguments: item);
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.cartList.add(item);
                            },
                            icon: Icon(Icons.add_shopping_cart)),
                        IconButton(
                            onPressed: () {
                              controller.itemList.removeAt(index);
                            },
                            icon: Icon(Icons.delete)),
                      ],
                    ),
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
