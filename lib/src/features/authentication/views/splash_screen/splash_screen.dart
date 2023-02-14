import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login_excerise/src/constants/colors.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/common_widgets/fade_in_animation/fade_in_anime_controller.dart';
import 'package:login_excerise/src/features/authentication/views/welcome_screen/welcome_screen.dart';
import 'package:login_excerise/src/utils/theme/widget_theme/text_theme.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';

import '../../../../constants/sizes.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animeController=Get.put(FadeInAnimeController());
    animeController.startSplashAnimation();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeInAnimation(
              durationInMs: 1000,
              animatedPositionModel: AnimatedPositionW(
                  topAfter: 10, topBefore: -30, leftAfter: 0, leftBefore: -30),
              widget: const Image(
                image: AssetImage(splashTopIcon),
              ),
            ),
            FadeInAnimation(
              durationInMs: 1000,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appName,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    appTagLine,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              animatedPositionModel: AnimatedPositionW(
                  topAfter: 200,
                  topBefore: 200,
                  leftAfter: defaultSize,
                  leftBefore: -80),
            ),
            FadeInAnimation(
              durationInMs: 1000,
              animatedPositionModel: AnimatedPositionW(
                  rightAfter: defaultSize,
                  rightBefore: defaultSize,
                  bottomAfter: 200,
                  bottomBefore: 0),
              widget: const Image(
                image: AssetImage(splashImage),
              ),
            ),
            FadeInAnimation(
              durationInMs: 1000,
              animatedPositionModel: AnimatedPositionW(
                  bottomBefore: 0,
                  bottomAfter: 100,
                  rightBefore: 25,
                  rightAfter: 25),
              widget: Container(
                  width: splashContainerSize,
                  height: splashContainerSize,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade200,
                      borderRadius: BorderRadius.circular(100))),
            ),
          ],
        ),
      ),
    );
  }
}
