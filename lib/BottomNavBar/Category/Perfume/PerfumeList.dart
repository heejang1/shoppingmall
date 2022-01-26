import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomNavBar/Category/Perfume/PerfumeDetail.dart';

class PerfumeList extends StatefulWidget {
  const PerfumeList({Key? key}) : super(key: key);

  @override
  _PerfumeListState createState() => _PerfumeListState();
}

class _PerfumeListState extends State<PerfumeList> {
  final List _Perfume = [];
  final _firebaseInstance = FirebaseFirestore.instance;

  fetchProduct() async {
    QuerySnapshot qn =
        await _firebaseInstance.collection("Perfume").get();
    setState(() {
      for(int i=0;i<qn.docs.length;i++) {
        _Perfume.add(
          {
            "imageUrl" : qn.docs[i]["imageUrl"],
            "name" : qn.docs[i]["name"],
            "price" : qn.docs[i]["price"],
            "description" : qn.docs[i]["description"],
            "detailImage" : qn.docs[i]["detailImage"]
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
            'Perfume',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
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
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                  itemCount: _Perfume.length,
                  itemBuilder: (_,index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 0,
                      ),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          _Perfume[index]["imageUrl"]
                        ),
                      ),
                      title: Text(
                        _Perfume[index]["name"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        _Perfume[index]["price"],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11
                        ),
                      ),
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(
                              builder: (_)=>PerfumeDetail(_Perfume[index]))),
                    );
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
