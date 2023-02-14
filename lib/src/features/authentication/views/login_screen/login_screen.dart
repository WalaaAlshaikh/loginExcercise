import 'package:flutter/material.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/constants/text_string.dart';

import 'login_footer_widget.dart';
import 'login_form_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FormHeaderWidget(image: welcomeImage,title: loginTitle,subTitle: loginSubTitle,),
            LoginForm(),
            LoginFooterWidget()
          ],
        ),
      ))),
    );
  }
}
