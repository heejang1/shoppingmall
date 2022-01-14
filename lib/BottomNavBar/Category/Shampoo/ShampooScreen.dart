import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ittierra_app/BottomNavBar/Category/Shampoo/ShampooProduct.dart';
import 'package:ittierra_app/Component/EmptyAppBar.dart';

class ShampooScreen extends StatelessWidget {
  const ShampooScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Shampoo',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ShampooProduct(),
          ],

        ),
      ),
    );
  }
}
