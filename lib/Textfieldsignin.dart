// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sia_layout/signin_controller.dart';
// import 'package:sia_layout/signup_controller.dart';
//
// class TextfieldSignin extends StatelessWidget {
//   final bool obscureText;
//   final String hintText;
//   final IconData icon;
//   final controller = Get.put(SignInController());
//
//    TextfieldSignin({Key? key, required controller,
//     required this.hintText, required this.obscureText, required this.icon}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  TextFormField(
//
//       obscureText: obscureText,
//       style: TextStyle(
//         color: Colors.black87,
//       ),
//       decoration: InputDecoration(
//
//         // prefixIcon: Icon(Icons.alternate_email),
//         // labelText: 'Email',
//
//         border: OutlineInputBorder(  borderSide: BorderSide(color: Color(0xFF2B8B97)),),
//         prefixIcon: Icon(icon, color: Colors.black87.withOpacity(.3),),
//         hintText: hintText,
//       ),
//
//       cursorColor: Colors.black87.withOpacity(.5),
//
//     );
//   }
// }
