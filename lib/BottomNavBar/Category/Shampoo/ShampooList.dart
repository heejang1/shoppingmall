import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List _Shampoo = [];
  final _firebaseInstance = FirebaseFirestore.instance;
  TextEditingController _searchController = TextEditingController();
  
  // fetchImages() async {
  //   QuerySnapshot qn = await _firebaseInstance.collection("Shampoo").get();
  //   setState(() {
  //     for(int i=0;i<qn.docs.length;i++){
  //       _Images.add(
  //         qn.docs[i]["imageUrl"],
  //       );
  //       print(qn.docs[i]["imageUrl"]);
  //     }
  //   });
  //   return qn.docs;
  // }

  fetchProduct() async {
    QuerySnapshot qn =
        await _firebaseInstance.collection("Shampoo").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++){
        _Shampoo.add(
          {
            "imageUrl" : qn.docs[i]["imageUrl"],
            "name" : qn.docs[i]["name"],
            "subtitle" : qn.docs[i]["subtitle"],
            "price" : qn.docs[i]["price"],
          }
        );
      }
    });
    return qn.docs;
  }

@override
  void initState() {
   fetchProduct();
   super.initState();
  }



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Shampoo',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(5)
            ),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                  itemCount: _Shampoo.length,
                  itemBuilder: (_,index){
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,vertical: 0
                      ),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          _Shampoo[index]["imageUrl"]
                        ),
                      ),
                      title: Text(
                        _Shampoo[index]["name"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _Shampoo[index]["subtitle"],
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      trailing: Text(
                        _Shampoo[index]["price"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                      onTap:  () {},
                    );
                  },
                ),
            )
          ],
        ),
      ),
    );
  }
}
