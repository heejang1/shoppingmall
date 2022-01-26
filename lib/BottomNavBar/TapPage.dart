import 'package:flutter/material.dart';
import 'package:ittierra_app/Account/screen/IsLogin.dart';
import 'package:ittierra_app/Account/screen/Login.dart';
import 'package:ittierra_app/Account/screen/MyPage.dart';
import 'package:ittierra_app/BottomNavBar/Category/Category/CategoryScreen.dart';
import 'Shopping cart/cart.dart';


class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 1;
  final List _pages = [
    const CategoryScreen(),
    const Text('Main'),
    const Cart(),
    const IsLogin(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
              icon: Icon(Icons.manage_search, color: Colors.black,),
              label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
            label: 'Shopping Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.black),
            label: 'My Page',
          ),
        ],
      ),
    );
  }
}
