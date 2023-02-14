import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/constants/validation.dart';
import 'package:login_excerise/src/features/authentication/views/onboarding_screen/onboarding_screen.dart';
import 'package:login_excerise/src/features/authentication/views/signup_screen/signup_screen.dart';
import 'package:login_excerise/src/features/authentication/views/splash_screen/splash_screen.dart';
import 'package:login_excerise/src/features/authentication/views/welcome_screen/welcome_screen.dart';
import 'package:login_excerise/src/features/core/views/dashboard/dashboard.dart';
import 'package:login_excerise/src/repository/auth_repository/exceptions/signup_email_passwoed_failure.dart';
import 'package:login_excerise/src/repository/user_repository/user_repo.dart';

import '../../features/authentication/models/user_model.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5));
    //firebaseUser.value = _auth.currentUser;
    // another way of writing
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> phoneAuth(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "+966$phoneNo",
          verificationCompleted: (credential) async {
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (e) {
            if (e.code == "invalid-phone-number") {
              Get.snackbar("Error", "The provided phone number is invalid");
            } else {
              Get.snackbar("Error", e.message.toString());
            }
          },
          codeSent: (verificationId, resendToken) {
            this.verificationId.value = verificationId;
          },
          codeAutoRetrievalTimeout: (verificationId) {
            this.verificationId.value = verificationId;
          });
    } catch (error) {
      Get.snackbar('Error!', error.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<bool> verifyOTP(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: this.verificationId.value, smsCode: otp));
    return credential.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(UserModel user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      firebaseUser.value == null
          ? Get.offAll(() => WelcomeScreen())
          : Get.offAll(() => const Dashboard());

      await UserRepository.instance.saveUserDataInFireStore(user);
      var userid = _auth.currentUser?.uid;
      print("---------  " + userid!);



    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print(" EXCEPTION - ${ex.message}");
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'Wrong E-mail') {
        message = 'Wrong E-mail';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
      );
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
