

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_string.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_string.dart';
import '../../../../authentication/models/user_model.dart';
import '../../../controllers/profile_controller.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

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
            menu4,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding:  const EdgeInsets.all(defaultSize - 10),
                child: FutureBuilder<List<UserModel>>(
                  future:controller.getAllUsers() ,
                  builder: (context, snapshot){
                    if(snapshot.connectionState== ConnectionState.done){
                      if(snapshot.hasData){
                        return ListView.builder(
                          shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              return Column(children: [
                                ListTile(
                                  iconColor: Colors.blue,
                                  tileColor: Colors.blue.withOpacity(0.1),
                                  leading: const Icon(LineAwesomeIcons.user_1),
                                  title: Text("Name: ${snapshot.data![index].fullName}"),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(snapshot.data![index].phoneNo),
                                      Text(snapshot.data![index].email),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                              ],);
                            },
                        );


                        // return Column(children: [
                        //   Stack(
                        //     children: [
                        //       SizedBox(
                        //         width: 120,
                        //         height: 120,
                        //         child: ClipRRect(
                        //             borderRadius: BorderRadius.circular(100),
                        //             child: const Image(
                        //               image: AssetImage(profileImage),
                        //             )),
                        //       ),
                        //       Positioned(
                        //         bottom: 0,
                        //         right: 0,
                        //         child: GestureDetector(
                        //           onTap: () {},
                        //           child: Container(
                        //             width: 35,
                        //             height: 35,
                        //             decoration: BoxDecoration(
                        //                 borderRadius: BorderRadius.circular(100),
                        //                 color: primaryColor),
                        //             child: const Icon(
                        //               LineAwesomeIcons.camera,
                        //               size: 20,
                        //               color: Colors.black,
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        //   const SizedBox(
                        //     height: 30,
                        //   ),
                        //   Form(
                        //       child: Column(
                        //         children: [
                        //           TextFormField(
                        //             initialValue: userData.fullName,
                        //             decoration: const InputDecoration(
                        //               label: Text(fullName),
                        //               prefixIcon: Icon(
                        //                 Icons.person_outline_rounded,
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: defaultSize-30,
                        //           ),
                        //           TextFormField(
                        //             initialValue: userData.email,
                        //             decoration: const InputDecoration(
                        //               label: Text(email),
                        //               prefixIcon: Icon(
                        //                 Icons.email_outlined,
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: defaultSize-30,
                        //           ),
                        //           TextFormField(
                        //             initialValue: userData.phoneNo,
                        //             decoration: const InputDecoration(
                        //               label: Text(phoneNum),
                        //               prefixIcon: Icon(
                        //                 Icons.phone_android_outlined,
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: defaultSize-30,
                        //           ),
                        //           TextFormField(
                        //             initialValue: userData.password,
                        //             decoration: const InputDecoration(
                        //               label: Text(password),
                        //               prefixIcon: Icon(
                        //                 Icons.password_outlined,
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: defaultSize-10,
                        //           ),
                        //
                        //           SizedBox(
                        //               width: double.infinity,
                        //               child: ElevatedButton(
                        //                 onPressed: () {
                        //                 },
                        //                 style: ElevatedButton.styleFrom(
                        //                     backgroundColor: primaryColor,
                        //                     side: BorderSide.none,
                        //                     shape: const StadiumBorder()),
                        //                 child: const Text(
                        //                   editProfile,
                        //                   style: TextStyle(color: darkColor),
                        //                 ),
                        //               )),
                        //           const SizedBox(
                        //             height: formHeight,
                        //           ),
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //             children:  [
                        //               const Text.rich(TextSpan(
                        //                   text: joined,
                        //                   style: TextStyle(fontSize: 12),
                        //                   children: [
                        //                     TextSpan(text: joinedAt, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold))
                        //                   ]
                        //               )),
                        //               ElevatedButton(
                        //                 onPressed: () {
                        //                 },
                        //                 style: ElevatedButton.styleFrom(
                        //                     backgroundColor: Colors.redAccent.withOpacity(0.1),
                        //                     elevation: 0,
                        //                     foregroundColor: Colors.red,
                        //                     shape: const StadiumBorder() ,
                        //                     side: BorderSide.none
                        //                 ),
                        //
                        //
                        //                 child: const Text(
                        //                   delete,
                        //
                        //                 ),
                        //               )
                        //
                        //
                        //             ],
                        //           )
                        //
                        //         ],
                        //       ))
                        // ]);
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
