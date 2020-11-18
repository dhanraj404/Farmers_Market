import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_market/src/models/user.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(MyUser user) {
    return _db.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<MyUser> fetchUser(String userId) {
    return _db
        .collection('users')
        .doc(userId)
        .get()
        .then((snapshot) => MyUser.fromFirestore((snapshot.data())));
  }
}
