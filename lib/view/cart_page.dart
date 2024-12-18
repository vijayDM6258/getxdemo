import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controller/home_controller.dart';

class CartPage extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: homeController.cartList.length,
          itemBuilder: (context, index) {
            var item = homeController.cartList[index];
            return ListTile(
              title: Text("${item.name}"),
              subtitle: Text("\$${item.price}"),
              trailing: IconButton(
                  onPressed: () {
                    homeController.cartList.removeAt(index);
                  },
                  icon: Icon(Icons.delete)),
            );
          },
        );
      }),
    );
  }
}
