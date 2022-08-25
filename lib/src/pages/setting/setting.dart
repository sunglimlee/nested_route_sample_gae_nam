import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/pages/setting/setting_detail.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
            onTap: () {
              Get.toNamed('/SettingDetailPage', id: 1); // 아이디를 주니깐 거기로 가는구나.
              //Get.to(SettingDetail(), id: 1); // 아이디를 주니깐 거기로 가는구나.
            },
            child: const Center(child: Text('SETTING 입니다. Get.toNamed(\'/second\', id:1) 을 이용해서 Settings Detail Page 로 갑니다.'))),
        GestureDetector(
            onTap: () {
              //Get.toNamed('/second', id: 1); // 아이디를 주니깐 거기로 가는구나.
              Get.to(SettingDetail(), id: 1); // 아이디를 주니깐 거기로 가는구나.
            },
    child: const Center(child: Text('SETTING 입니다. Get.to(SettingDetail(), id:1) 을 이용해서 Settings Detail Page 로 갑니다.'))),
      ],
    );
  }
}
