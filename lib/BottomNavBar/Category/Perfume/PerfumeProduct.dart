import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ittierra_app/Controller/ProductController.dart';

class PerfumeProduct extends StatelessWidget {
  final perfumeController = Get.put(PerfumeController());
  PerfumeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Flexible(
          child: ListView.builder(
              itemCount: perfumeController.perfume.length,
              itemBuilder: (BuildContext context, int index) {
                return PerfumeProductCard(index: index);
              }
          ),
        )
    );
  }
}
class PerfumeProductCard extends StatelessWidget {
  // final cartController = Get.put(CartController());
  final PerfumeController perfumeController = Get.find();
  final int index;
  PerfumeProductCard({
    Key? key,
    required this.index
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
              perfumeController.perfume[index].imageUrl,
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: TextButton(
              child: Text(
                perfumeController.perfume[index].name,
                style: const TextStyle(color: Colors.black),
              ),
              style: TextButton.styleFrom(
                alignment: Alignment.centerLeft,
                primary: Colors.transparent,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              onPressed: () {},
            ),
          ),
          // Expanded(
          //     child: Text('${shampooController.shampoo[index].price}'),
          // ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt)
          )
        ],
      ),
    );
  }
}
