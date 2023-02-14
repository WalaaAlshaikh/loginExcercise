import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String subtitle;
  final String conuterText;
  final Color bgColors;


  OnboardingModel(
      {required this.image,
      required this.title,
      required this.bgColors,
      required this.conuterText,
      required this.subtitle,
   });
}
