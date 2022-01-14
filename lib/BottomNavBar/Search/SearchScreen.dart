import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomNavBar/Search/SearchBar.dart';
import 'package:ittierra_app/BottomNavBar/TapPage.dart';
import 'package:ittierra_app/Component/DefaultAppBar.dart';
import 'package:ittierra_app/Component/DefaultBackButton.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const DefaultAppBar(
          title: "search",
          child: DefaultBackButton(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            margin: EdgeInsets.symmetric(horizontal:20),
            child: const TextField(
              cursorHeight: 17,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                icon: Icon(Icons.search_outlined, color: Colors.black),
                hintText: "Find you want",
                hintStyle: TextStyle(fontSize: 17)
              ),
            ),
          ),
          SearchBar(
            text: "Popular Keyword",
            textColor: Colors.grey.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
