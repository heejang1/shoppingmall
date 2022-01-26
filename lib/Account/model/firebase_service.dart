import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future updateEmail(String email) async {
    return await userCollection.doc(uid).update({
      'email': email
    });
  }

  Future deleteUser() {
    return userCollection.doc(uid).delete();
  }
}

class AuthService {
  User user = FirebaseAuth.instance.currentUser!;
  Future reAuthCredential(String email, String password) async {
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      await user.reauthenticateWithCredential(credentials);
  }

  Future updateEmail(newEmail) async{
    await user.updateEmail(newEmail);
    await DatabaseService(uid: user.uid).updateEmail(newEmail);
  }

  Future updatePassword(newPassword) async{
    await user.updatePassword(newPassword);
  }

  Future deleteUser() async {
    await DatabaseService(uid: user.uid)
        .deleteUser(); // called from database class
    await user.delete();
  }

// Future deleteUser(String email, String password) async {
//   User user = _auth.currentUser!;
//   if(email == user.email) {
//     AuthCredential credentials =
//         EmailAuthProvider.credential(email: email, password: password);
//     UserCredential result =
//         await user.reauthenticateWithCredential(credentials);
//     await DatabaseService(uid: result.user!.uid)
//         .deleteUser(); // called from database class
//     await result.user?.delete();
//     return true;
//   }
//   return null;
// }
}
