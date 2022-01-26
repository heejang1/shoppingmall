import 'package:flutter/material.dart';

class Chips extends StatelessWidget {
  final String text;
  const Chips({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chip(
        backgroundColor: Colors.white,
        shadowColor: Colors.grey,
        shape: const StadiumBorder(
          side: BorderSide(
              width: 4,
              color: Colors.grey
          ),
        ),
        label: Text(
          text,
          style: TextStyle(
              color: Colors.black.withOpacity(0.8)
          ),
        ),
      ),
    );
  }
}

class Sub extends StatelessWidget {
  const Sub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
