import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../models/onboarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(defaultSize),
      color: model.bgColors,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(model.image,height: size.height * 0.4,),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                model.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.conuterText,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 90,)
        ],
      ),
    );
  }
}