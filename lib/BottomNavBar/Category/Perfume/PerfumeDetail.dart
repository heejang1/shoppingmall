
import 'package:flutter/material.dart';
import 'package:ittierra_app/BottomNavBar/Shopping%20cart/cart.dart';

class PerfumeDetail extends StatefulWidget {
  var _Perfume;
  PerfumeDetail(this._Perfume, {Key? key}) : super(key: key);

  @override
  _PerfumeDetailState createState() => _PerfumeDetailState();
}

class _PerfumeDetailState extends State<PerfumeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () =>
                Navigator.push(context, MaterialPageRoute(
                    builder: (_) => Cart())),
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black,),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.only(top: 40, right: 14, left: 14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .4,
                            padding: const EdgeInsets.only(bottom: 30),
                            width: double.infinity,
                            child: Image.network(
                                widget._Perfume['imageUrl']
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget._Perfume['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget._Perfume['price'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: Text(
                              widget._Perfume['description'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ExpansionTile(
                            title: const Text(
                              '제품 펼쳐보기/닫기',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
                            ),
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Image.network(
                                    widget._Perfume['detailImage'],
                                  fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          )
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   padding: const EdgeInsets.only(bottom: 30),
                          //   child: Image.network(
                          //       widget._Perfume['detailImage'],
                          //     fit: BoxFit.fitWidth,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
