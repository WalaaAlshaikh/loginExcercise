import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:login_excerise/src/constants/colors.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/features/authentication/views/login_screen/login_screen.dart';
import 'package:login_excerise/src/features/authentication/views/signup_screen/signup_screen.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_anime_controller.dart';

class WelcomeScreen extends StatelessWidget {




   WelcomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final animeController=Get.put(FadeInAnimeController());
    animeController.startAnimation();
    var mediaQuery=MediaQuery.of(context);
    var height=mediaQuery.size.height;
    var brightness=mediaQuery.platformBrightness;
    final isDarkMode=brightness== Brightness.dark;
    return Scaffold(

      backgroundColor: isDarkMode? secondaryColor :primaryColor,
      body: Stack(
        children: [
          FadeInAnimation(
            durationInMs: 1000,
            animatedPositionModel: AnimatedPositionW(
              bottomAfter: 0,
              bottomBefore: -200,
              leftBefore: 0,
              leftAfter: 0,
              topBefore: 0,
              topAfter: 0,
              rightBefore: 0,
              rightAfter: 0

            ),
            widget: Container(
              padding: EdgeInsets.all(defaultSize),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage(welcomeImage),height:height* 0.4),
                  Column(
                    children: [
                      Text(welcomeTitle,style: Theme.of(context).textTheme.displayLarge,),
                      Text(welcomeSubTitle,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(child: OutlinedButton(onPressed: (){
                        Get.to(()=>const LoginScreen());
                      },
                      child: Text(loginText.toUpperCase())),),
                      const SizedBox(width: 10,),
                      Expanded(child: ElevatedButton(onPressed: (){

                        Get.to(()=> const SignUpScreen());
                      },child: Text(signupText.toUpperCase())),),
                    ],
                  )
                ],
              ) ,
            ),
          ),
        ],
      ),
    );
  }
}
