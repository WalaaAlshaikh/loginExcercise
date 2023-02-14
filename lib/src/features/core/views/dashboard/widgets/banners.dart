import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardBgColor,
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark),
                        )),
                    const Flexible(
                        child: Image(
                          image: AssetImage(
                              "assets/images/casual-life-3d-pink-book-in-air.png"),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  dashboardBannerTitle1,
                  style: textTheme.headline4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  dashboardBannerSubtitle,
                  style: textTheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: dashboardPadding - 10,
        ),
        Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cardBgColor,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark),
                              )),
                          const Flexible(
                              child: Image(
                                image: AssetImage("assets/images/logo1.png"),
                              )),
                        ],
                      ),
                      Text(
                        dashboardBannerTitle2,
                        style: textTheme.headline4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dashboardBannerSubtitle,
                        style: textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(dashboardButton)))
              ],
            ))
      ],
    );
  }
}
