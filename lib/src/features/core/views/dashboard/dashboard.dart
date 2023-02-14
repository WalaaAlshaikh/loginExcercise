import 'package:flutter/material.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/features/core/views/dashboard/widgets/appbar.dart';
import 'package:login_excerise/src/features/core/views/dashboard/widgets/banners.dart';
import 'package:login_excerise/src/features/core/views/dashboard/widgets/categories.dart';
import 'package:login_excerise/src/features/core/views/dashboard/widgets/search.dart';
import 'package:login_excerise/src/features/core/views/dashboard/widgets/top_course.dart';

import '../../../../constants/colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(dashboardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            Text(
              dashboardTitle,
              style: textTheme.bodyMedium,
            ),
            Text(
              dashboardHeading,
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: dashboardPadding,
            ),
            // Search Box
            DashboardSearchBox(textTheme: textTheme),
            const SizedBox(
              height: dashboardPadding,
            ),

            //Categories
            DashboardCategories(textTheme: textTheme),
            const SizedBox(
              height: dashboardPadding,
            ),
            //Banners

            DashboardBanners(textTheme: textTheme),
            const SizedBox(
              height: dashboardPadding,
            ),

            // Top Courses
            Text(
              dashboardTopCourses,
              style: textTheme.headline4?.apply(fontSizeFactor: 1.2),
            ),

            TopCourseWidget(textTheme: textTheme),
          ],
        ),
      )),
    );
  }
}




