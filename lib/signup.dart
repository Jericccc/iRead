// import 'package:flutter/material.dart';
// import 'package:sia_layout/CustomTextfield.dart';
// import 'package:sia_layout/signin.dart';
// import 'package:get/get.dart';
// import 'package:sia_layout/signup_controller.dart';
//
// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);
//
//
//   @override
//   State<SignUp> createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   static final _formKey = new GlobalKey<FormState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//
//
//     final size = MediaQuery
//         .of(context)
//         .size;
//
//     return SafeArea(
//       child: Scaffold(
//
//         backgroundColor: Color(0xFFF0FEFF),
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//
//                 SizedBox(width: double.infinity,
//                     child: Image(
//                       image: const AssetImage('lib/images/signup.png'),
//                       height: size.height * 0.3,)
//                 ),
//                 const Text('Sign Up',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25,
//                     color: Color(0xFF2B8C97),
//                     fontFamily: 'NunitoSans',),
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 20),
//
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomTextField(
//                             controller: controller.fullName,
//                             hintText: 'Full Name',
//                             obscureText: false,
//                             icon: (Icons.person_outline_rounded)),
//                         SizedBox(height: 20),
//
//                         CustomTextField(
//                             controller: controller.email,
//                             hintText: 'Email',
//                             obscureText: false,
//                             icon: (Icons.alternate_email)),
//
//                         SizedBox(height: 20),
//
//                         CustomTextField(
//                             controller: controller.phoneNo,
//                             hintText: 'Contact Number',
//                             obscureText: false,
//                             icon: (Icons.numbers)),
//
//                         SizedBox(height: 20),
//
//                         CustomTextField(
//                             controller: controller.password,
//                             hintText: 'Password',
//                             obscureText: true,
//                             icon: (Icons.lock)),
//
//
//
//                         SizedBox(height: 20),
//
//                         SizedBox(
//                           width: double.infinity,
//                           height: 40,
//                           child: ElevatedButton(onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               SignUpController.instance.registerUser(
//                                   controller.email.text.trim(),
//                                   controller.password.text.trim());
//                             }
//                           },
//                             style: ElevatedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.all(
//                                       Radius.circular(5.0))
//                               ),
//                               foregroundColor: Colors.white,
//                               backgroundColor: (Color(0xFF2B8B97)),
//                             ),
//                             child: Text('Signup'.toUpperCase()),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                   ),
//
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: Text('OR'),
//
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 40,
//                       child: OutlinedButton.icon(
//                         icon: Image(image: AssetImage(
//                             'lib/images/google.png'), width: 20.0,),
//                         onPressed: () {},
//                         label: Text('Sign-In with Google',
//                           style: TextStyle(
//                             color: Color(0xFF2B8C97),
//                             fontFamily: 'NunitoSans',
//                             fontWeight: FontWeight.bold,
//                           ),),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(onPressed: () {
//                       Navigator.pushReplacement(
//                           context, MaterialPageRoute(builder: (
//                           _) => const SignIn()));
//                     },
//                       child: const Text.rich(
//                           TextSpan(
//                               text: "Already have an Account?",
//                               style: TextStyle(
//                                   color: Colors.black87),
//                               children: const[
//                                 TextSpan(
//                                     text: ' Login',
//                                     style: TextStyle(
//                                       color: Color(0xFF2B8C97),
//                                     )
//                                 )
//                               ]
//                           )
//                       ),)
//                   ],
//                 )
//               ],
//
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
//
