import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/features/authentication/views/forgot_password/forgot_password_otp/otp_screen.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class ForgotPassEmailScreen extends StatelessWidget {
  const ForgotPassEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: defaultSize * 2,
                ),
                const FormHeaderWidget(
                  image: forgotPasswordImage,
                  title: forgotPassword,
                  subTitle: forgotPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: defaultSize -10,),
                Form(child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(email),
                        hintText: email,
                        prefixIcon: Icon(Icons.mail_lock_rounded)
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: (){
                            Get.to(()=> const OTPScreen());

                          },
                          child: const Text(next)),
                    )

                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
