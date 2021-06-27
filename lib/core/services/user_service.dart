import 'package:cloud_firestore/cloud_firestore.dart';
import '/models/user_model.dart';

class UserService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  addUserToFirestore(UserModel user) {
    users.doc(user.uid).set(user.toMap());
  }
}
