import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/controller/root_controller.dart';
import 'package:nested_route_sample/src/navigator/setting_navigator.dart';
import 'package:nested_route_sample/src/pages/explore/explore.dart';
import 'package:nested_route_sample/src/pages/home/home.dart';
import 'package:nested_route_sample/src/pages/setting/setting.dart';
import 'package:nested_route_sample/src/pages/setting/setting_detail.dart';

class Root extends GetView<RootController> {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          appBar: myAppBar(),
          body: IndexedStack(
            index: controller.rootPageIndex.value,
            children: [
              const Home(),
              Navigator(
                key: controller.navigatorKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => const Explore(),
                  );
                },
              ),
              settingNavigator4(),
            ],
          ),
          bottomNavigationBar: myBottomNavigationBar(),
        ),
      ),
    );
  }
  PreferredSizeWidget myAppBar() {
    return AppBar(
      leading: controller.isCategoryPageOpen.value
          ? GestureDetector(
        onTap: controller.back,
        child: const Icon(Icons.arrow_back_ios),
      )
          : Container(),
      centerTitle: true,
      title: controller.isCategoryPageOpen.value
          ? const Text('Music Menu')
          : const Text('Nested Route Sample'),
    );
  }
  Widget myBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: controller.rootPageIndex.value,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: controller.changeRootPageIndex,
        items: const [
        BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Colors.grey),
    label: 'home',
    activeIcon: Icon(Icons.home, color: Colors.blue),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.explore, color: Colors.grey),
    label: 'explore',
    activeIcon: Icon(Icons.explore, color: Colors.blue),
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.settings, color: Colors.grey),
    label: 'settings',
    activeIcon: Icon(Icons.settings, color: Colors.blue),
    ),
      ]
    );
  }

  // GetX ????????? ????????? ?????? // TODO ?????? GetX readme ??? ???????????????.
  // ???????????? ?????? ??????, ????????? ????????? ???????????? ??????
  Widget settingNavigator1() {
    return Navigator(
        key: Get.nestedKey(1), // create a key by index
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return GetPageRoute(
              page: () => Scaffold(
                appBar: AppBar(
                  title: Text("Main"),
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/SettingDetailPage', id:1); // navigate by your nested route by index
                    },
                    child: Text("Go to Setting Detail Page"),
                  ),
                ),
              ),
            );
          } else if (settings.name == '/SettingDetailPage') {
            return GetPageRoute(
              page: () => Center(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Main"),
                  ),
                  body: Center(
                      child:  Text("Setting Detail Page")
                  ),
                ),
              ),
            );
          }
        }
    );
  }
  // ???????????? ?????? ??????, ?????? ???????????? ???????????? ??????
  Widget settingNavigator2() {
    return Navigator(
        key: Get.nestedKey(1), // create a key by index, ??? ????????? Global Key ?????????.
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return GetPageRoute(
              page: () => Setting(),
            );
          } else if (settings.name == '/SettingDetailPage') {
            return GetPageRoute(
              page: () => Center(
                child: SettingDetail(),
              ),
            );
          }
        }
    );
  }
  // Navigator ??? ?????? ??????
  Widget settingNavigator3() {
    return Navigator(
      key: Get.nestedKey(1),
      onGenerateRoute: (settings) {
        return GetPageRoute(
          page: () => Setting(),
        );
      },
    );
  }
  // ???????????? ?????? ?????????
  // Map ??? ????????? ??????
  Widget settingNavigator4() {
    return const SettingNavigator();
  }

}

