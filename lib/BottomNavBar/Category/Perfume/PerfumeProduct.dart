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
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: NetworkImage(
          perfumeController.perfume[index].imageUrl,
        ),
      ),
      title: Text(
        perfumeController.perfume[index].name,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold
        ),
      ),
      trailing: Text(
        perfumeController.perfume[index].price,
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
        ),
      ),
      onTap: () {},
    );
  }
}
