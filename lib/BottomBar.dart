import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ITTIERRA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: TabBarWidget(),
    );
  }
}
class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TabPage(),
      ),
    );
  }
}
class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 1;
  final List _pages = [const Text('Search'), const Text('Main'), const Text('Shopping Bag')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search), label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined), label: 'Shopping Bag',
          ),
        ],
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
