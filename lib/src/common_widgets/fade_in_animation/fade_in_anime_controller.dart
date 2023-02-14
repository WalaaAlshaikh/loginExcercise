import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/views/onboarding_screen/onboarding_screen.dart';
import 'package:login_excerise/src/features/authentication/views/welcome_screen/welcome_screen.dart';

class FadeInAnimeController extends GetxController{
  static FadeInAnimeController get find=> Get.find();

RxBool animate =false.obs;

Future startSplashAnimation() async{
  await Future.delayed(Duration(milliseconds: 200));
    animate.value=true;
  await Future.delayed(Duration(milliseconds: 2000));
  animate.value=false;
  await Future.delayed(Duration(milliseconds: 1000));
  Get.off(()=>  WelcomeScreen());
 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()));
}

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 200));
    animate.value=true;
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WelcomeScreen()));
  }
}