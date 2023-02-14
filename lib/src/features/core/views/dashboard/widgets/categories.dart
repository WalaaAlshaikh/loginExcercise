import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_string.dart';
import '../../../models/dashboard/dashboard_model.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final list=DashboardCategoriesModel.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return
          GestureDetector(
            onTap: list[index].onPress,
            child: SizedBox(
              width: 170,
              height: 50,
              child: Row(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkColor),
                    child: Center(
                      child: Text(
                        list[index].title,
                        style: textTheme.titleLarge
                            ?.apply(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          list[index].heading,
                          style: textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(list[index].subHeading,
                            style: textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        // children: [
        //
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: darkColor),
        //           child: Center(
        //             child: Text(
        //               "JS",
        //               style: textTheme.titleLarge
        //                   ?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 dashboardBannerTitle2,
        //                 style: textTheme.titleLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(dashboardBannerSubtitle,
        //                   style: textTheme.bodyMedium,
        //                   overflow: TextOverflow.ellipsis),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   SizedBox(
        //     width: 170,
        //     height: 50,
        //     child: Row(
        //       children: [
        //         Container(
        //           width: 45,
        //           height: 45,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: darkColor),
        //           child: Center(
        //             child: Text(
        //               "JS",
        //               style: textTheme.titleLarge
        //                   ?.apply(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 5,
        //         ),
        //         Flexible(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text(
        //                 dashboardBannerTitle2,
        //                 style: textTheme.titleLarge,
        //                 overflow: TextOverflow.ellipsis,
        //               ),
        //               Text(dashboardBannerSubtitle,
        //                   style: textTheme.bodyMedium,
        //                   overflow: TextOverflow.ellipsis),
        //             ],
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ],
      ),
    );
  }
}
