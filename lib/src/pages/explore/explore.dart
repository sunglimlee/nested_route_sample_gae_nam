import 'package:flutter/material.dart';
import 'package:nested_route_sample/src/controller/root_controller.dart';
import 'package:nested_route_sample/src/pages/explore/explore_detail_page.dart';
import 'package:get/get.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  Widget _list() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => Container(
              margin: const EdgeInsets.all(8),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryMenu(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            RootController.to.setCategoryPage(true);
            // GetX 를 사용하면 Navigator 도 이렇게 navigator 로 사용하며, context 가 필요없다.
            Navigator.push(context,  // 봐라.. 이미 nested Navigator 안에 들어와 있다.
                MaterialPageRoute(
                    builder: (context) => const ExploreDetailPage()));
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _categoryMenu(context),
        Expanded(child: _list()),
      ],
    );
  }
}
