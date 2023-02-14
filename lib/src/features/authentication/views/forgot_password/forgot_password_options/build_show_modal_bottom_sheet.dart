import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/views/forgot_password/forgot_password_mail/forgot_pass_mail.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';
import 'forgot_password_btn_widget.dart';

class ForgotPasswordScreenFunction{
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(defaultSize-10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forgotPasswordTitle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              forgotEmailSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            forgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_outlined,
              title: email,
              subTitle: resetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(()=> const ForgotPassEmailScreen());
              },
            ),
            const SizedBox(
              height: 15,
            ),
            forgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_outlined,
              title: phoneNum,
              subTitle: resetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }


}



