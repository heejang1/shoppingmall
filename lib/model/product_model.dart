import 'package:cloud_firestore/cloud_firestore.dart';

class Shampoo {
  final String name;
  final String price;
  final String imageUrl;

  const Shampoo({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  static Shampoo fromSnapshot(DocumentSnapshot snap) {
    Shampoo shampoo = Shampoo(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return shampoo;
  }
}


class Bodywash {
  final String name;
  final String price;
  final String imageUrl;

  const Bodywash({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  static Bodywash fromSnapshot(DocumentSnapshot snap) {
    Bodywash bodywash = Bodywash(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return bodywash;
  }
}

class Perfume {
  final String name;
  final String price;
  final String imageUrl;

  const Perfume({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
  static Perfume fromSnapshot(DocumentSnapshot snap) {
    Perfume perfume = Perfume(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
    );
    return perfume;
  }
}