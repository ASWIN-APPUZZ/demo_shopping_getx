import 'package:demo_shopping_getx/constants/strings.dart';
import 'package:demo_shopping_getx/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../screens/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              )
            ]),
        body: Column(children: [
            Padding(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  const Expanded(
                      child: Text(Strings.heading1,
                          style: TextStyle(
                              fontFamily: 'avenir',
                              fontSize: 32,
                              fontWeight: FontWeight.w900))),
                  IconButton(
                      icon: const Icon(Icons.view_agenda_outlined),
                      onPressed: () {}),
                  IconButton(icon: const Icon(Icons.grid_view), onPressed: () {})
                ])),
            Expanded(child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                  // physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1));
              }
            }))
          ]),
        );
  }
}
