import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/controller/root_controller.dart';
import 'package:nested_route_sample/src/pages/explore/explore.dart';
import 'package:nested_route_sample/src/pages/home/home.dart';
import 'package:nested_route_sample/src/pages/setting/setting.dart';

class Root extends GetView<RootController> {
  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onWillPop,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
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
          ),
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
              settingNavigator(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
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
            ],
          ),
        ),
      ),
    );
  }
  // TODO // 여기서부터 이 Navigator 를 자유자재로 사용하는 방법을 보자.
  // 페이지를 따로 만들어주는것.
  // 그러기 위해서 감싸줄 수 있도록 하는것
  Widget settingNavigator() {
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
                      Get.toNamed('/second', id:1); // navigate by your nested route by index
                    },
                    child: Text("Go to second"),
                  ),
                ),
              ),
            );
          } else if (settings.name == '/second') {
            return GetPageRoute(
              page: () => Center(
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("Main"),
                  ),
                  body: Center(
                      child:  Text("second")
                  ),
                ),
              ),
            );
          }
        }
    );
  }
}
