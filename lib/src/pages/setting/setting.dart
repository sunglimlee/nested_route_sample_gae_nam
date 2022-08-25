import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed('/SettingDetail', id: 1);
        },
        child: const Center(child: Text('SETTING')));
  }
}
