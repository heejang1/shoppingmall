import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomNavBar/Category/BodyWash/BodywashDetail.dart';

class BodywashList extends StatefulWidget {
  const BodywashList({Key? key}) : super(key: key);

  @override
  _BodywashListState createState() => _BodywashListState();
}

class _BodywashListState extends State<BodywashList> {
  final List _Bodywash = [];
  final _firebaseInstance = FirebaseFirestore.instance;

  fetchProduct() async {
    QuerySnapshot qn =
      await _firebaseInstance.collection("Bodywash").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++) {
        _Bodywash.add(
          {
            "imageUrl" : qn.docs[i]["imageUrl"],
            "name" : qn.docs[i]["name"],
            "subtitle" : qn.docs[i]["subtitle"],
            "price" : qn.docs[i]["price"],
            "description" : qn.docs[i]["description"],
            "detailImage" : qn.docs[i]["detailImage"],
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
            "BodyWash",
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
            const SizedBox(height: 10,),
            Expanded(
                child: ListView.builder(
                  itemCount: _Bodywash.length,
                  itemBuilder: (_,index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 0
                      ),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          _Bodywash[index]["imageUrl"]
                        ),
                      ),
                      title: Text(
                        _Bodywash[index]["name"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _Bodywash[index]["subtitle"],
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      trailing: Text(
                        _Bodywash[index]["price"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>BodywashDetail(_Bodywash[index]))),
                    );
                  },
                )
            )
          ],
        ),
      ),
    );
  }
}
