import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/controller/root_controller.dart';

class TestController implements Bindings {
  @override
  void dependencies() {
    Get.put<RootController>(RootController()); // permanant 로 인해서 계속 살아있게 된다.
  }
}
