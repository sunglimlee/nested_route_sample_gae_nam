import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/pages/setting/setting.dart';
import 'package:nested_route_sample/src/pages/setting/setting_detail.dart';

class SettingNavigatorRoutes {
  static const String root = '/Setting'; // 이렇게 루트를 static 으로 정하고
  static const String settingDetail = '/SettingDetail';
}

class SettingNavigator extends StatelessWidget {
  const SettingNavigator({Key? key}) : super(key: key);
  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      SettingNavigatorRoutes.root: (context) => const Setting(),
      SettingNavigatorRoutes.settingDetail: (context) => const SettingDetail(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context); // 루트 빌더 가지고 있으면서
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: SettingNavigatorRoutes.root, // 맨처음에는 root 로 시작한다.
      onGenerateRoute: (routeSettings) { // initialRoute 의 TabNavigatorRoutes.root 를 routeSettings 로 넘겨준다. 아규먼트도 설정가능하다.
        if (routeSettings.name == SettingNavigatorRoutes.root) {
          return GetPageRoute(
            page: () {
              return routeBuilders[routeSettings.name!]!(context);
            }
          );
        } else {
          return GetPageRoute(
              page: () {
                return routeBuilders[routeSettings.name!]!(context);
              }
          );
        }
      },
    );
  }
}


