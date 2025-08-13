import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_b21_firebase/models/user.dart';

class UserServices {
  static const kUserCollection = "userCollection";

  ///Create User
  Future createUser(UserModel model) async {
    return await FirebaseFirestore.instance
        .collection(kUserCollection)
        .doc(model.docId)
        .set(model.toJson());
  }

  ///Get User
  Future<UserModel> getUser(String userID) {
    return FirebaseFirestore.instance
        .collection(kUserCollection)
        .doc(userID)
        .get()
        .then((userJson) => UserModel.fromJson(userJson.data()!));
  }

  ///Update User
  Future updateProfile(UserModel userModel) async {
    return await FirebaseFirestore.instance
        .collection(kUserCollection)
        .doc(userModel.docId)
        .update({
          "name": userModel.name,
          "phone": userModel.phone,
          "address": userModel.address,
        });
  }
}
