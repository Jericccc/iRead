import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_example/signin_email_password_failure.dart';
import 'package:google_ml_kit_example/signup_email_password_failure.dart';
// import 'package:sia_layout/home_page.dart';
// import 'package:sia_layout/login_page.dart';
// import 'package:sia_layout/signin_email_password_failure.dart';
// import 'package:sia_layout/signup_email_password_failure.dart';

import 'home_page.dart';
import 'login_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variables
  final _auth = FirebaseAuth.instance; //instance from firebase
  late final Rx<User?> firebaseUser;  //userId

//when user is already login instantlly go to Homepage

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const Login()) : Get
        .offAll(() => const HomePage());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const HomePage()) : Get.to(() => const Login());

    } on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print ('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;

    } catch(_){}
    const ex = SignUpWithEmailAndPasswordFailure();
    print ('FIREBASE AUTH EXCEPTION - ${ex.message}');
    throw ex;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }


  Future<void> logout() async => await _auth.signOut();
}