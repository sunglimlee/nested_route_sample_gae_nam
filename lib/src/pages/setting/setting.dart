import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed('/second', id: 1); // 아이디를 주니깐 거기로 가는구나.
        },
        child: const Center(child: Text('SETTING 입니다.')));
  }
}
