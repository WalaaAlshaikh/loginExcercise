import 'package:flutter/material.dart';
import 'package:login_excerise/src/features/core/models/dashboard/course_model.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';

class TopCourseWidget extends StatelessWidget {
  const TopCourseWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final list=DashboardCourseModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index ){
          return
            SizedBox(
                width: 320,
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10,top: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardBgColor,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                                child: Text(
                                  list[index].title,
                                  style: textTheme.headline4,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                             Flexible(
                                child: Image(
                                  image: AssetImage(
                                     list[index].image),
                                  height: 110,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder()
                                ),
                                onPressed: () {}, child: Icon(Icons.play_arrow)),
                            const SizedBox(width: dashboardPadding,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(list[index].section,style: textTheme.headline4, overflow: TextOverflow.ellipsis,),
                                Text(list[index].lessons,style: textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ));
        },
        // children: [
        //
        //
        //   SizedBox(
        //       width: 320,
        //       height: 200,
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: 10,top: 5),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: cardBgColor,
        //           ),
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Flexible(
        //                       child: Text(
        //                         "Flutter Crash Course",
        //                         style: textTheme.headline4,
        //                         maxLines: 2,
        //                         overflow: TextOverflow.ellipsis,
        //                       )),
        //                   const Flexible(
        //                       child: Image(
        //                         image: AssetImage(
        //                             "assets/images/clip-reading-of-books-1.png"),
        //                         height: 110,
        //                       ))
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   ElevatedButton(
        //                       style: ElevatedButton.styleFrom(
        //                           shape: const CircleBorder()
        //                       ),
        //                       onPressed: () {}, child: Icon(Icons.play_arrow)),
        //                   const SizedBox(width: dashboardPadding,),
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text("J Sections",style: textTheme.headline4, overflow: TextOverflow.ellipsis,),
        //                       Text("Programming Languages",style: textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
        //                     ],
        //                   )
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       )),
        //   SizedBox(
        //       width: 320,
        //       height: 200,
        //       child: Padding(
        //         padding: const EdgeInsets.only(right: 10,top: 5),
        //         child: Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: cardBgColor,
        //           ),
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Flexible(
        //                       child: Text(
        //                         "Flutter Crash Course",
        //                         style: textTheme.headline4,
        //                         maxLines: 2,
        //                         overflow: TextOverflow.ellipsis,
        //                       )),
        //                   const Flexible(
        //                       child: Image(
        //                         image: AssetImage(
        //                             "assets/images/clip-reading-of-books-1.png"),
        //                         height: 110,
        //                       ))
        //                 ],
        //               ),
        //               Row(
        //                 children: [
        //                   ElevatedButton(
        //                       style: ElevatedButton.styleFrom(
        //                           shape: const CircleBorder()
        //                       ),
        //                       onPressed: () {}, child: Icon(Icons.play_arrow)),
        //                   const SizedBox(width: dashboardPadding,),
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text("J Sections",style: textTheme.headline4, overflow: TextOverflow.ellipsis,),
        //                       Text("Programming Languages",style: textTheme.bodyText2, overflow: TextOverflow.ellipsis,),
        //                     ],
        //                   )
        //                 ],
        //               )
        //             ],
        //           ),
        //         ),
        //       )),
        //
        //
        // ],
      ),
    );
  }
}

