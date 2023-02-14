

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_excerise/src/features/authentication/models/user_model.dart';
import 'package:login_excerise/src/repository/auth_repository/auth_repo.dart';
import 'package:login_excerise/src/repository/user_repository/user_repo.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();



  final _authRepo= Get.put(AuthRepository());
  final _userRepo= Get.put(UserRepository());

  Future<UserModel>?  getUserData(){
    final email= _authRepo.firebaseUser.value?.email;

    if(email != null){
     return _userRepo.getUserDetails(email);

    } else{
      Get.snackbar("Error", "Login to continue");
      return null;
    }
  }
  
  Future<List<UserModel>> getAllUsers() async{
    return await _userRepo.allUsers();
  }

  updateRecord(UserModel user)async{
    await _userRepo.updateUserData(user);
  }
}