import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_excerise/src/constants/colors.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:login_excerise/src/features/authentication/models/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: controller.controller,
            onPageChangeCallback: controller.onPageChangeCallback,
            pages: controller.pages,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
              bottom: 90,
              child: OutlinedButton(
                onPressed: () {
                  controller.nextPage();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black26),
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(20)),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: darkColor, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              )),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                child: Text("Skip", style: TextStyle(color: Colors.grey)),
                onPressed: () {
                  controller.skip();
                },
              )),
          Obx(() => Positioned(
              bottom: 45,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage.value,
                effect: const WormEffect(
                    activeDotColor: Color(0xff272727), dotHeight: 5),
                count: 3,
              )))
        ],
      ),
    );
  }
}
