import 'package:get/get.dart';
import 'package:login_excerise/src/features/core/views/dashboard/dashboard.dart';
import 'package:login_excerise/src/repository/auth_repository/auth_repo.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified= await AuthRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();

  }



}