import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/core/views/profile/profile_screen.dart';
import 'package:login_excerise/src/repository/auth_repository/auth_repo.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class DashboardAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        appName,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          margin: const EdgeInsets.only(top: 5, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardBgColor,
          ),
          child: IconButton(
            onPressed: () {
              //AuthRepository.instance.logout();
              Get.to(const ProfileScreen());

            },
            icon: const Image(
              image: AssetImage(userProfileImage),
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
