import 'package:cloud_firestore/cloud_firestore.dart';

class Shampoo {
  final String name;
  final String price;
  final String imageUrl;
  final String subtitle;

  const Shampoo({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.subtitle
  });
  static Shampoo fromSnapshot(DocumentSnapshot snap) {
    Shampoo shampoo = Shampoo(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
      subtitle: snap['subtitle']
    );
    return shampoo;
  }
}


class Bodywash {
  final String name;
  final String price;
  final String imageUrl;
  final String subtitle;

  const Bodywash({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.subtitle,
  });
  static Bodywash fromSnapshot(DocumentSnapshot snap) {
    Bodywash bodywash = Bodywash(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl'],
      subtitle: snap['subtitle'],
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