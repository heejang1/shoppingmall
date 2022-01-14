import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomNavBar/Category/BodyWash/BodyWashScreen.dart';
import 'package:ittierra_app/BottomNavBar/Category/Category/CategoryItems.dart';
import 'package:ittierra_app/BottomNavBar/Category/Category/CategoryView.dart';
import 'package:ittierra_app/BottomNavBar/Category/Perfume/PerfumeScreen.dart';
import 'package:ittierra_app/BottomNavBar/Category/Shampoo/ShampooScreen.dart';
import 'package:ittierra_app/BottomNavBar/Search/SearchScreen.dart';
import 'package:ittierra_app/constant.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black,),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: const Text('Shampoo'),
              trailing: IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ShampooScreen(),
                  )
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ShampooScreen(),
                  )
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Body Wash'),
              trailing: IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BodywashScreen(),
                  )
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BodywashScreen(),
                  )
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Perfumes'),
              trailing: IconButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PerfumeScreen(),
                  )
                ),
                icon: const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PerfumeScreen(),
                  )
              ),
            ),
          ),
        ],
      ),
      // CategoryView(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   column: 1,
      //   items: categoryList.length,
      //   ratio: 3,
      //   direction: Axis.vertical,
      //   color: Colors.white,
      //   itemBuilder: (context, index) {
      //     return CategoryItems(
      //       height: 150.0,
      //       width: MediaQuery.of(context).size.width,
      //       align: Alignment.center,
      //       radius: 10.0,
      //       color: Colors.black,
      //       // image: categoryList[index].image,
      //       title: categoryList[index].category,
      //       titleSize: 21.0,
      //     );
      //   },
      // ),
    );
  }
}
