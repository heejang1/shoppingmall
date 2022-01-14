import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final int column, items;
  // final Widget child;
  final Color color;
  final double ratio, height, width;
  final direction, itemBuilder;
  const CategoryView({
    Key? key,
    required this.column,
    required this.items,
    required this.color,
    required this.ratio,
    // required this.child,
    required this.height,
    required this.width,
    required this.direction,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
      child: GridView.builder(
        padding: EdgeInsets.all(5),
        scrollDirection: direction,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: column,
            childAspectRatio: ratio,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
          ),
          itemCount: items,
          itemBuilder: itemBuilder,
      ),
    );
  }
}