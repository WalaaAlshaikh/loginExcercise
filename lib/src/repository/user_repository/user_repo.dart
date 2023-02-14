import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  saveUserDataInFireStore(UserModel user) async {
    String? uid = auth.currentUser?.uid;

    await _db
        .collection("Users")
        .doc(uid)
        .set(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went Wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async{
    final snapshot= await _db.collection("Users").where("Email", isEqualTo:email ).get();
    final userData= snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }

  Future<List<UserModel>> allUsers() async{
    final snapshot= await _db.collection("Users").get();
    final userData= snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();

    return userData;
  }

  Future<void> updateUserData(UserModel user)async{
    String? uid = auth.currentUser?.uid;
    await _db.collection("Users").doc(uid).update(user.toJson());

  }


}
