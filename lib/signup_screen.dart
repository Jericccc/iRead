import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/signin.dart';
import 'package:google_ml_kit_example/signup_form_widget.dart';
// import 'package:sia_layout/signin.dart';
// import 'package:sia_layout/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery
        .of(context)
        .size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                SizedBox(width: double.infinity,
                child: Image(
                  image: const AssetImage('lib/images/signup.png'),
                  height: size.height * 0.3,)
                ),
            const Text('Sign Up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color(0xFF2B8C97),
                fontFamily: 'NunitoSans',),
            ),
           SignUpFormWidget(),



            SizedBox(height: 20),

            // SizedBox(
            //   width: double.infinity,
            //   height: 40,
            //   child: ElevatedButton(onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.all(
            //               Radius.circular(5.0))
            //       ),
            //       foregroundColor: Colors.white,
            //       backgroundColor: (Color(0xFF2B8B97)),
            //     ),
            //     child: Text('Signup'.toUpperCase()),
            //   ),
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
              icon: Image(image: AssetImage(
                  'lib/images/google.png'), width: 20.0,),
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
          TextButton(onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (
                _) => const SignIn()));
          },
            child: const Text.rich(
                TextSpan(
                    text: "Already have an Account?",
                    style: TextStyle(
                        color: Colors.black87),
                    children: const[
                      TextSpan(
                          text: ' Login',
                          style: TextStyle(
                            color: Color(0xFF2B8C97),
                          )
                      )
                    ]
                )
            ),
                    ),
        ],
      ),
      ],
            ),
    ),
      ),
      ),
    );

  }
}

