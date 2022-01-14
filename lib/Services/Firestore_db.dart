import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ittierra_app/model/product_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Shampoo>> getShampoo() {
    return _firebaseFirestore
        .collection('Shampoo')
        .snapshots()
        .map((snapshot) {
       return snapshot.docs.map((doc) => Shampoo.fromSnapshot(doc)).toList();
    });
  }
  
  Stream<List<Bodywash>> getBodywash() {
    return _firebaseFirestore
        .collection('Bodywash')
        .snapshots()
        .map((snapshot) {
       return snapshot.docs.map((doc) => Bodywash.fromSnapshot(doc)).toList();
    });
  }

  Stream<List<Perfume>> getPerfume() {
    return _firebaseFirestore
        .collection('Perfume')
        .snapshots()
        .map((snapshot) {
       return snapshot.docs.map((doc) => Perfume.fromSnapshot(doc)).toList();
    });
  }
}