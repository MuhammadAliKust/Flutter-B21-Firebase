import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_b21_firebase/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel model = UserModel();

  void setUser(UserModel val) {
    model = val;
    notifyListeners();
  }

  UserModel getUser() => model;
}
