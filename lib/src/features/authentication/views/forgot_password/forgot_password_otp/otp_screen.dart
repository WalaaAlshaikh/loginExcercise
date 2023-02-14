import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/features/authentication/controllers/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OTPController());
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultSize -10),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(otpTitle,style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80
            ),),
            Text(otpSubTitle.toUpperCase(),style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 20,),
            const Text("$otpMessage support@walaa.com",textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            OtpTextField(
               numberOfFields: 6,
              fillColor: Colors.black26.withOpacity(0.1),
              filled: true,
              keyboardType: TextInputType.number,
              onSubmit: (code){
                 otp= code;
                 OTPController.instance.verifyOTP(otp);

              },
            ),
            const SizedBox(height: 20,),
            SizedBox(
               width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  OTPController.instance.verifyOTP(otp);

                }, child: const Text(next)))
          ],
        ),
      ),
    );
  }
}
