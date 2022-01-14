import 'package:flutter/material.dart';


class CategoryItems extends StatelessWidget {
  final double height, width, radius, titleSize;
  // final String image;
  final String title;
  final Color color;
  final align;
  const CategoryItems({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
    required this.titleSize,
    // required this.image,
    required this.title,
    required this.color,
    required this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(radius),
            //     image: DecorationImage(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       colorFilter: ColorFilter.mode(color, BlendMode.difference),
            //     )
            // ),
          ),
          Align(
            alignment: align,
            child: Text.rich(
                TextSpan(
                    children: [
                      TextSpan(
                          text: title,
                          style: TextStyle(
                            color: Colors.black, fontSize: titleSize,
                          )
                      )
                    ]
                )
            ),
          )
        ],
      ),
    );
  }
}

