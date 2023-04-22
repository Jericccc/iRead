// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:sia_layout/authentication_repository.dart';
// import 'package:sia_layout/firebase_options.dart';
// import 'package:sia_layout/home_page.dart';
// import 'package:sia_layout/onboardingpage.dart';
// import 'package:get/get.dart';
//
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((value) => Get.put(AuthenticationRepository()));
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return  const GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Splash(),
//     );
//   }
// }
//
// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   State<Splash> createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash> {
//   void initState(){
//     super.initState();
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color(0xFFF0FEFF),
//       body: Container(
//         margin: const EdgeInsets.only(top: 170.0),
//         padding: EdgeInsets.only(top: 50.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//
//           children: [
//             Image(image: const AssetImage('lib/images/logoiread7.png'), height: size.height * 0.33, ),
//             const SizedBox(height: 250,),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
