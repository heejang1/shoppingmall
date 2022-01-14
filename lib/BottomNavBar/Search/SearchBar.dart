import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String text;
  final Color textColor;
  const SearchBar({
    Key? key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontSize: 20
        ),
      ),
    );
  }
}
