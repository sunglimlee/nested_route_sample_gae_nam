import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/controller/root_controller.dart';
import 'package:nested_route_sample/src/controller/test_controller.dart';
import 'package:nested_route_sample/src/pages/home/detail_page.dart';
import 'package:nested_route_sample/src/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() { // 여기처럼 한꺼번에 Get.put 할 때 유용하다.
        Get.put(RootController());
      }),
      //initialBinding: TestController(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/detailPage', page: () => const DetailPage())],
      home: Root(),
    );
  }
}
