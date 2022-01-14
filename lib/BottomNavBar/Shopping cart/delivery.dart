import 'package:flutter/material.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  _DeliveryState createState() => _DeliveryState();
}

final FocusNode _nameFocus = FocusNode();
final FocusNode _phoneFocus = FocusNode();
final FocusNode _addressFocus = FocusNode();

final nameEditingController = TextEditingController();
final emailEditingController = TextEditingController();
final passwordEditingController = TextEditingController();
final cPasswordEditingController = TextEditingController();

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
