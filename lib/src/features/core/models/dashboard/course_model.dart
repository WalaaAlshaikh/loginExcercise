

import 'dart:ui';

import 'package:login_excerise/src/constants/image_string.dart';

class DashboardCourseModel{
  final String title;
  final String section;
  final String lessons;
  final String image;
  final VoidCallback? onPress;

  DashboardCourseModel(this.title,this.section,this.onPress,this.lessons,this.image);


  static List<DashboardCourseModel> list =[
    DashboardCourseModel("Flutter Crash Course", "4 Sections", null, "10 lessons",forgotPasswordImage),
    DashboardCourseModel("HTML/ CSS Course", "2 Sections", null, "35 lessons", welcomeImage),
    DashboardCourseModel("Material Design Course", "KOTLIN", null, "20 lessons", splashImage),

  ];

}