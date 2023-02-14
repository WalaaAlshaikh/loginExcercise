import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_excerise/src/features/authentication/models/user_model.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_string.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_string.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller =Get.put(ProfileController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            editProfile,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(defaultSize - 10),
                child: FutureBuilder(
                  future:controller.getUserData() ,
                  builder: (context, snapshot){
                    if(snapshot.connectionState== ConnectionState.done){
                      if(snapshot.hasData){
                        UserModel userData= snapshot.data as UserModel;

                        final emails=TextEditingController(text:userData.email );
                        final passwords=TextEditingController(text:userData.password);
                        final fullNames=TextEditingController(text:userData.fullName);
                        final phoneNos=TextEditingController(text:userData.phoneNo);

                        return Column(children: [
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
                                    onTap: () {},
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: primaryColor),
                                      child: const Icon(
                                        LineAwesomeIcons.camera,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: fullNames,
                                      decoration: const InputDecoration(
                                        label: Text(fullName),
                                        prefixIcon: Icon(
                                          Icons.person_outline_rounded,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultSize-30,
                                    ),
                                    TextFormField(
                                      controller: emails,
                                      decoration: const InputDecoration(
                                        label: Text(email),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultSize-30,
                                    ),
                                    TextFormField(
                                      controller: phoneNos,
                                      decoration: const InputDecoration(
                                        label: Text(phoneNum),
                                        prefixIcon: Icon(
                                          Icons.phone_android_outlined,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultSize-30,
                                    ),
                                    TextFormField(
                                      controller: passwords,
                                      decoration: const InputDecoration(
                                        label: Text(password),
                                        prefixIcon: Icon(
                                          Icons.password_outlined,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: defaultSize-10,
                                    ),

                                    SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final userData= UserModel(
                                                email: emails.text.trim(),
                                                password: passwords.text.trim(),
                                                fullName: fullNames.text.trim(),
                                                phoneNo: phoneNos.text.trim());
                                            await controller.updateRecord(userData);
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
                                    const SizedBox(
                                      height: formHeight,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:  [
                                        const Text.rich(TextSpan(
                                            text: joined,
                                            style: TextStyle(fontSize: 12),
                                            children: [
                                              TextSpan(text: joinedAt, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                                            ]
                                        )),
                                        ElevatedButton(
                                          onPressed: () async{

                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent.withOpacity(0.1),
                                              elevation: 0,
                                              foregroundColor: Colors.red,
                                              shape: const StadiumBorder() ,
                                              side: BorderSide.none
                                          ),


                                          child: const Text(
                                            delete,

                                          ),
                                        )


                                      ],
                                    )

                                  ],
                                ))
                          ]);
                      } else if(snapshot.hasError){
                        return Center(child: Text(snapshot.error.toString()),);
                      } else{
                        return const Center(child: Text("Something went wrong"));
                      }

                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  },

                ))));
  }
}
