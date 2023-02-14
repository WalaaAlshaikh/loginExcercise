import 'package:flutter/material.dart';

import '../../../../../constants/text_string.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
      BoxDecoration(border: Border(left: BorderSide(width: 3))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dashboardSearch,
            style: textTheme.displayMedium
                ?.apply(color: Colors.grey.withOpacity(0.5)),
          ),
          Icon(
            Icons.mic,
            size: 23,
          )
        ],
      ),
    );
  }
}
