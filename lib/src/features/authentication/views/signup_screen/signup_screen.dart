import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_excerise/src/common_widgets/form/form_header_widget.dart';
import 'package:login_excerise/src/constants/colors.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/features/authentication/views/login_screen/login_screen.dart';
import 'package:login_excerise/src/features/authentication/views/signup_screen/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children:  [
                const FormHeaderWidget(
                    image: welcomeImage,
                    title: signUpTitle,
                    subTitle: signUpSubTitle),
                const SignUpFormWidget(),
                Column(
                  children:  [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: (){},
                          label:  const Text(googleSignIn),
                      icon:const Image(image:AssetImage(googleLogoImage) ,width: 20,) ,),
                    ),
                    TextButton(onPressed: () {
                      Get.to(()=> const LoginScreen());
                    },
                        child: Text.rich(TextSpan(text: alreadyAccount,style: Theme.of(context).textTheme.bodyLarge,
                            children: [
                              TextSpan(
                                  text:loginText.toUpperCase()
                              ),
                            ] )))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
