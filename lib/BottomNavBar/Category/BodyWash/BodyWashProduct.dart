import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ittierra_app/Component/EmptyAppBar.dart';
import 'package:ittierra_app/Controller/ProductController.dart';

class BodywashProduct extends StatelessWidget {
  final bodywashController = Get.put(BodywashController());
  BodywashProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Flexible(
          child: ListView.builder(
              itemCount: bodywashController.bodywash.length,
              itemBuilder: (BuildContext context, int index) {
                return BodywashProductCard(index: index);
              }
          ),
        )
    );
  }
}

class BodywashProductCard extends StatelessWidget {
  // final cartController = Get.put(CartController());
  final BodywashController bodywashController = Get.find();
  final int index;
  BodywashProductCard({
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
          bodywashController.bodywash[index].imageUrl,
        ),
      ),
      title: Text(
        bodywashController.bodywash[index].name,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Text(
        bodywashController.bodywash[index].subtitle,
        style: TextStyle(
          fontSize: 13
        ),
      ),
      trailing: Text(
        bodywashController.bodywash[index].price,
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
        ),
      ),
      onTap: () {},
    );
  }
}
