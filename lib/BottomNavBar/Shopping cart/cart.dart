import 'package:flutter/material.dart';

import 'delivery.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: FlatButton(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 10),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Delivery(),
          ),
        ),
        child: const Text('Pay', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cart'),
          ],
        ),
      ),
    );
  }
}
