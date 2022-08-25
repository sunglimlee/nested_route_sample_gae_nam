import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingDetail extends StatelessWidget {
  const SettingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
            onTap: () => Get.back(id:1), // 아이디를 주니깐 거기로 가는구나.
            child: Text('Setting Detail Page')),
      ),
    );
  }
}
