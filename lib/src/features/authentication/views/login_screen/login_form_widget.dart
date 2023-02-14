import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/views/forgot_password/forgot_password_options/build_show_modal_bottom_sheet.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../../../constants/validation.dart';
import '../../controllers/signup_controller.dart';
import '../forgot_password/forgot_password_options/forgot_password_btn_widget.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: authController.email,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline_outlined),
              labelText: email,
              hintText: email,
            ),
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value!)) {
                return 'Invalid Email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: defaultSize - 27,
          ),
          TextFormField(
            controller: authController.password,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outline),
              labelText: password,
              hintText: password,

              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp)),
            ),
            validator: (value) {
              if (value.toString().length < 6) {
                return " Wrong password";
              } else {
                return null;
              }
            },
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgotPasswordScreenFunction.buildShowModalBottomSheet(context);
                  },
                  child: Text(forgotPassword,
                      style: Theme.of(context).textTheme.bodyLarge))),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      String email = authController.email.text.trim();
                      String password = authController.password.text;
                      print("dubg: ${email}");

                      SignUpController.instance.loginUser(email, password);


                    }
                    // show loding page after press login in button
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );


                  }, child: Text(loginText.toUpperCase())))
        ],
      ),
    ));
  }}

