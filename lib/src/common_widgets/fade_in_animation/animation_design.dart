import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';

import '../../constants/image_string.dart';
import 'fade_in_anime_controller.dart';

class FadeInAnimation extends StatelessWidget {
   FadeInAnimation({
    super.key,
     required this.durationInMs, this.animatedPositionModel, required this.widget
  });
   final animeController=Get.put(FadeInAnimeController());
  final int durationInMs;
  final AnimatedPositionW? animatedPositionModel;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(
        duration:  Duration(milliseconds: durationInMs),
        top: animeController.animate.value ? animatedPositionModel!.topAfter : animatedPositionModel!.topBefore,
        left: animeController.animate.value ? animatedPositionModel!.leftAfter : animatedPositionModel!.leftBefore,
        bottom: animeController.animate.value ? animatedPositionModel!.bottomAfter : animatedPositionModel!.bottomBefore,
        right: animeController.animate.value ? animatedPositionModel!.rightAfter : animatedPositionModel!.rightBefore,
        child:AnimatedOpacity(
          duration:  Duration(milliseconds: durationInMs),
          opacity: animeController.animate.value? 1: 0,
          child:widget)
    ));
  }
}