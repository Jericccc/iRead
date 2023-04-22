import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication_repository.dart';



class SignInController extends GetxController {
  static SignInController get instance => Get.find();


  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();


  //Call this Function from Design & it will do the rest
  void loginUser(String email, String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }


}