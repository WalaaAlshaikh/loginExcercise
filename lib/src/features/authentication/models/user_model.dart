import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "id": id,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data=doc.data()!;
    return UserModel(
      id: data["id"],
        email: data["Email"],
        password: data["Password"],
        fullName: data["FullName"],
        phoneNo: data["Phone"]);
  }
}
