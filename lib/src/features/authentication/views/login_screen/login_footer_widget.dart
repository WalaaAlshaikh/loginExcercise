import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_excerise/src/features/authentication/views/signup_screen/signup_screen.dart';

import '../../../../constants/image_string.dart';
import '../../../../constants/text_string.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              label: Text(googleSignIn),
              icon: const Image(
                image: AssetImage(googleLogoImage),
                width: 20,
              ),
            )),
        const SizedBox(
          height: 10,
        ),
        TextButton(onPressed: () {
          Get.to(()=> const SignUpScreen());
        },
            child: Text.rich(TextSpan(text: dontHaveAccount,style: Theme.of(context).textTheme.bodyLarge,
                children:const [
                  TextSpan(
                      text:signupText
                  ),
                ] )))
      ],
    );
  }
}
