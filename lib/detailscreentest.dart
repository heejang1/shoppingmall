import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  var _Shampoo;
  DetailScreen(this._Shampoo, {Key? key}) :super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
          ),
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
                        // borderRadius: BorderRadius.only(
                        //   topRight: Radius.circular(30),
                        //   topLeft: Radius.circular(30),
                        // )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .4,
                            padding: const EdgeInsets.only(bottom: 30),
                            width: double.infinity,
                            child: Image.network(
                                widget._Shampoo['imageUrl']
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
                          Text(
                            widget._Shampoo['name'],
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget._Shampoo['subtitle'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                widget._Shampoo['price'],
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
                              widget._Shampoo['description'],
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: MediaQuery.of(context).size.width ,
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Image.network(
                              widget._Shampoo['detailImage'],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          )
        ],
      )
    );
  }
}
