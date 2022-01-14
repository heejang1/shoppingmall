import 'package:get/get.dart';
import 'package:ittierra_app/Services/Firestore_db.dart';
import 'package:ittierra_app/model/product_model.dart';

class ShampooController extends GetxController {
  final shampoo = <Shampoo>[].obs;
  @override
  void onInit() {
    shampoo.bindStream(FirestoreDB().getShampoo());
    super.onInit();
  }
}

class BodywashController extends GetxController {
  final bodywash = <Bodywash>[].obs;
  @override
  void onInit() {
    bodywash.bindStream(FirestoreDB().getBodywash());
    super.onInit();
  }
}

class PerfumeController extends GetxController {
  final perfume = <Perfume>[].obs;
  @override
  void onInit() {
    perfume.bindStream(FirestoreDB().getPerfume());
    super.onInit();
  }
}