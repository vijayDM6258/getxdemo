import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/view/cart_page.dart';
import 'package:getxdemo/view/detail_page.dart';
import 'package:getxdemo/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/DetailPage", page: () => DetailPage()),
        GetPage(name: "/CartPage", page: () => CartPage()),
      ],
    );
  }
}
