import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/signin_controller.dart';
import 'package:google_ml_kit_example/signin_form_widget.dart';
import 'package:google_ml_kit_example/signup_screen.dart';
// import 'package:sia_layout/CustomTextfield.dart';
// import 'package:sia_layout/signin_controller.dart';
// import 'package:sia_layout/signin_form_widget.dart';
// import 'package:sia_layout/signup.dart';
// import 'package:sia_layout/signup_screen.dart';
import 'package:get/get.dart';
import 'Textfieldsignin.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  static final _formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());

    final size = MediaQuery.of(context).size;



    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF0FEFF),
        body: SingleChildScrollView(

          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(width: double.infinity,
                    child: Image(image: const AssetImage('lib/images/signin2.png'), height: size.height * 0.3, )),
                const Text('Sign In',
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xFF2B8C97),
                    fontFamily: 'NunitoSans',),
                ),

                SignInFormWidget(),
                // Form(
                //   child: Container(
                //     padding: EdgeInsets.symmetric(vertical: 20),
                //
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //        TextfieldSignin(
                //           controller: controller.email,
                //           hintText: 'Email',
                //           obscureText: false,
                //           icon: (Icons.alternate_email)),
                //       const SizedBox(height: 20),
                //       // TextFormField(
                //       //   decoration: const InputDecoration(
                //       //       prefixIcon: Icon(Icons.lock),
                //       //
                //       //       labelText: 'Password',
                //       //       hintText: 'Password',
                //       //       border: OutlineInputBorder(),
                //       //       suffixIcon: IconButton(onPressed: null,
                //       //           icon: Icon(Icons.remove_red_eye_sharp),),
                //       //   ),
                //       // ),
                //
                //        TextfieldSignin(
                //           controller: controller.password,
                //           hintText: 'Password',
                //           obscureText: true,
                //           icon: (Icons.lock)),
                //
                //       const SizedBox(height: 5),
                //       Align(
                //         alignment: Alignment.centerRight,
                //           child: TextButton(
                //              onPressed: () {}, child: const Text('Forgot Password?',
                //           style: TextStyle(
                //             color: Color(0xFF2B8B97),
                //           ),)),
                //       ),
                //       SizedBox(
                //         width: double.infinity,
                //           height: 40,
                //           child: ElevatedButton( onPressed: () {
                //             if (_formKey.currentState!.validate()) {
                //               SignInController.instance.loginUser(
                //                   controller.email.text.trim(),
                //                   controller.password.text.trim());
                //             }
                //           },
                //             style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.all(Radius.circular(5.0))
                //               ),
                //
                //               foregroundColor: Colors.white,
                //               backgroundColor: (Color(0xFF2B8B97)),
                //             ),
                //             child: Text('Login'.toUpperCase()),
                //           ),
                //        ),
                //       ],
                //
                //    ),
                //   )
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('OR'),

                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton.icon(
                          icon: Image(image: AssetImage('lib/images/google.png'), width: 20.0,),
                          onPressed: () {},
                          label: Text('Sign-In with Google',
                          style: TextStyle(
                            color: Color(0xFF2B8C97),
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ),
                const SizedBox(
                  height: 20,
                ),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
                    },
                    child: const Text.rich(
                        TextSpan(
                          text: "Don't have an Account?",
                            style: TextStyle(
                                color: Colors.black87),
                          children: const[
                            TextSpan(   text: ' Signup',
                              style: TextStyle(
                                color: Color(0xFF2B8C97),
                              )
                            )
                          ]
                        )
                    ),)
                  ],
                )
              ],

            ),
          ),
        ),
      ),

    );
  }
}
