import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_string.dart';
import '../../../constants/text_string.dart';
import '../models/onboarding_model.dart';
import '../views/onboarding_screen/onboarding_widget.dart';

class OnboardingController extends GetxController{

  final controller= LiquidController();
  RxInt currentPage=0.obs;

  final pages = [
    OnBoardingWidget(
        model: OnboardingModel(
          image: boardingPage1Image,
          title: boardingTitle1,
          bgColors: boardingPage1Color,
          subtitle: boardingSubTitle1,
          conuterText: boardingCounter1,
        )),
    OnBoardingWidget(
        model: OnboardingModel(
          image: boardingPage2Image,
          title: boardingTitle2,
          bgColors: boardingPage2Color,
          subtitle: boardingSubTitle2,
          conuterText: boardingCounter2,
        )),
    OnBoardingWidget(
        model: OnboardingModel(
          image: boardingPage3Image,
          title: boardingTitle3,
          bgColors: boardingPage3Color,
          subtitle: boardingSubTitle3,
          conuterText: boardingCounter3,
        )),
  ];

  onPageChangeCallback(int activePageIndex) {
    currentPage.value=activePageIndex;
  }

  skip()=> controller.jumpToPage(page: 2);

  nextPage(){
    int nextPage=controller.currentPage +1;
    controller.animateToPage(page: nextPage);
  }
}