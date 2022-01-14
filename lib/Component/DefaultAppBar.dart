import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  //final action;
  const DefaultAppBar({
    Key? key,
    required this.title,
    required this.child,
    //required this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(30.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      iconTheme:  IconThemeData(color: Colors.black),
      leading:  child,
      //actions: action,
    );
  }
}
