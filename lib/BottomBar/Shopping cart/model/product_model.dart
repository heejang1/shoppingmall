import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String itName;
  final String itPrice;
  final String itImageUrl;

  const Product({
    required this.itName,
    required this.itPrice,
    required this.itImageUrl,
  });
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
        itName: snap['itName'],
        itPrice: snap['itPrice'],
        itImageUrl: snap['itImageUrl'],
    );
    return product;
  }
}