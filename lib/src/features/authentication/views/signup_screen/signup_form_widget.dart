import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/controllers/signup_controller.dart';
import 'package:login_excerise/src/features/authentication/models/user_model.dart';
import 'package:login_excerise/src/features/authentication/views/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:login_excerise/src/repository/user_repository/user_repo.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../../../constants/validation.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: formHeight - 20),
      child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: authController.fullName,
                decoration: const InputDecoration(
                  label: Text(fullName),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                  ),
                ),
              ),
              const SizedBox(
                height: formHeight - 30,
              ),
              TextFormField(
                controller: authController.email,
                // validator: (value) {
                //   if (!RegExp(validationEmail).hasMatch(value!)) {
                //     return 'Invalid Email';
                //   } else {
                //     return null;
                //   }
                // },
                decoration: const InputDecoration(
                  label: Text(email),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: formHeight - 30,
              ),
              TextFormField(
                controller: authController.phoneNo,
                decoration: const InputDecoration(
                  label: Text(phoneNum),
                  prefixIcon: Icon(
                    Icons.numbers_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: formHeight - 30,
              ),
              TextFormField(
                // validator: (value) {
                //   if (!RegExp(validationPassword).hasMatch(value!)) {
                //     return 'Password length must be 8 and contain a number,\n a special symbol, and an uppercase letter.';
                //   } else {
                //     return null;
                //   }
                // },
                controller: authController.password,
                decoration: const InputDecoration(
                  label: Text(password),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                  ),
                ),
              ),
              const SizedBox(
                height: formHeight - 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {


                      if (formKey.currentState!.validate()) {
                        // String email = authController.email.text.trim();
                        // String password = authController.password.text;
                        // String phoneNo = authController.phoneNo.text;
                        // SignUpController.instance.phoneAuthentication(phoneNo);
                        // Get.to(()=> OTPScreen());
                        // //AuthController.instance.createUser(email, password);
                        final user= UserModel(
                            email: authController.email.text.trim(),
                            password: authController.password.text.trim(),
                            fullName: authController.fullName.text.trim(),
                            phoneNo: authController.phoneNo.text.trim(),

                        );
                        SignUpController.instance.saveUserDataInFirebase(user);



                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                      }
                    },
                    child: Text(signupText.toUpperCase())),
              )
            ],
          )),
    );
  }
}
