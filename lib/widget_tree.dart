// import 'package:flutter/material.dart';
// import 'package:sia_layout/authentication_repository.dart';
// import 'package:sia_layout/home_page.dart';
// import 'package:sia_layout/signup.dart';
//
// class WidgetTree extends StatefulWidget {
//   const WidgetTree({Key? key}) : super(key: key);
//
//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }
//
// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.hasData){
//           return HomePage();
//
//         } else {
//           return const SignUp();
//         }
//       },
//     );
//   }
// }
