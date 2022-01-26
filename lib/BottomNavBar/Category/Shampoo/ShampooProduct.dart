import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ittierra_app/Controller/ProductController.dart';
import 'package:ittierra_app/detailscreentest.dart';

class ShampooProduct extends StatelessWidget {
  final shampooController = Get.put(ShampooController());
  ShampooProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => Flexible(
          child: ListView.builder(
              itemCount: shampooController.shampoo.length,
              itemBuilder: (BuildContext context, int index) {
                return ShampooProductCard(index: index);
              }),
        )
    );
  }
}
class ShampooProductCard extends StatelessWidget {
  // final cartController = Get.put(CartController());
  final ShampooController shampooController = Get.find();
  final int index;
  ShampooProductCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
          shampooController.shampoo[index].imageUrl,
        ),
      ),
      title: Text(
        shampooController.shampoo[index].name,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        shampooController.shampoo[index].subtitle,
        style: const TextStyle(
            fontSize: 13
        ),
      ),
      trailing: Text(
        shampooController.shampoo[index].price,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 11,
        ),
      ),
      onTap: () {},
    );
  }
}

