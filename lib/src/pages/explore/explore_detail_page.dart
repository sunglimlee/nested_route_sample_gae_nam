import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nested_route_sample/src/controller/root_controller.dart';

class ExploreDetailPage extends StatelessWidget {
  const ExploreDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          onTap: () { RootController.to.onWillPop();},
            child: Text('ExploreDetailPages')),
      ),
    );
  }
}

