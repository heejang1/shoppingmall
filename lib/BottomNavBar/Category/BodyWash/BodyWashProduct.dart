import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              bodywashController.bodywash[index].imageUrl,
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
              child: TextButton(
                child: Text(
                  bodywashController.bodywash[index].name,
                  style: const TextStyle(color: Colors.black),
                ),
                style: TextButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  primary: Colors.transparent,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {},
              ),
          ),
          // Expanded(
          //     child: Text('${bodywashController.bodywash[index].price}'),
          // ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt)
          ),
        ],
      ),
    );
  }
}
