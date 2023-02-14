

import 'dart:ui';

class DashboardCategoriesModel{
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(this.title,this.heading,this.onPress,this.subHeading);


  static List<DashboardCategoriesModel> list =[
    DashboardCategoriesModel("JS", "Java Script", null, "10 lessons"),
    DashboardCategoriesModel("F", "Flutter", null, "11 lessons"),
    DashboardCategoriesModel("H", "HTML", null, "8 lessons"),
    DashboardCategoriesModel("R", "KOTLIN", null, "20 lessons"),
    DashboardCategoriesModel("JS", "Python", null, "100 lessons"),

  ];

}