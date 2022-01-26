import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomNavBar/Category/BodyWash/BodyWashProduct.dart';

class BodywashScreen extends StatelessWidget {
  const BodywashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
           backgroundColor: Colors.white,
           elevation: 0,
           title: const Text(
            'Body Wash',
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
              BodywashProduct(),
            ],
          ),
        ),
    );
  }
}
