import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_excerise/src/constants/colors.dart';
import 'package:login_excerise/src/constants/image_string.dart';
import 'package:login_excerise/src/constants/sizes.dart';
import 'package:login_excerise/src/constants/text_string.dart';
import 'package:login_excerise/src/features/authentication/models/user_model.dart';
import 'package:login_excerise/src/features/core/views/profile/update_profile_screen.dart';
import 'package:login_excerise/src/features/core/views/profile/widgets/profile_menu.dart';
import 'package:login_excerise/src/features/core/views/profile/widgets/user_list_screen.dart';
import 'package:login_excerise/src/repository/auth_repository/auth_repo.dart';

import '../../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          profile,
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(defaultSize -10),
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context,snapshot){
            if(snapshot.connectionState== ConnectionState.done){
              if(snapshot.hasData){
                UserModel userData= snapshot.data as UserModel;

                return Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                image: AssetImage(profileImage),
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              width: 35,height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: primaryColor
                              ),
                              child: const Icon(LineAwesomeIcons.alternate_pencil, size: 20,color: Colors.black,),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                    userData.fullName,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      userData.email,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(()=>  UpdateProfileScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder()),
                          child: const Text(
                            editProfile,
                            style: TextStyle(color: darkColor),
                          ),
                        )),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),
                    // Menu

                    ProfileMenuWidget(title: menu1,icon: LineAwesomeIcons.cog,onPress: (){},),
                    ProfileMenuWidget(title: menu3,icon: LineAwesomeIcons.wallet,onPress: (){},),
                    ProfileMenuWidget(title: menu4,icon: LineAwesomeIcons.user_check,onPress: (){
                      Get.to(()=> const UserList());

                    },),
                    const Divider(color: Colors.grey,),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(title: menu2,icon: LineAwesomeIcons.info,onPress: (){},),
                    ProfileMenuWidget(title: menu5,icon: LineAwesomeIcons.alternate_sign_out,onPress: (){
                      AuthRepository.instance.logout();
                    },
                      textColor: Colors.red,
                      endIcon: false,),

                  ],
                );
              } else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              } else{
                return const Center(child: Text("Something went wrong"));
              }

            }else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },

        ),
      )),
    );
  }
}


