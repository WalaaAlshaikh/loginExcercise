import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/models/user_model.dart';
import 'package:login_excerise/src/repository/auth_repository/auth_repo.dart';
import 'package:login_excerise/src/repository/user_repository/user_repo.dart';

import '../views/forgot_password/forgot_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final userRepo = Get.put(UserRepository());

  void createUser(UserModel user) {
    AuthRepository.instance.createUserWithEmailAndPassword(user);
  }

  void loginUser(String email, String password) {
    AuthRepository.instance.loginUserWithEmailAndPassword(email, password);
  }

  Future<void> saveUserDataInFirebase(UserModel user) async {
    createUser(user);

    Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuth(phoneNo);
  }
}
