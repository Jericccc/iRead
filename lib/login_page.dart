import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/signin.dart';
import 'package:google_ml_kit_example/signup_screen.dart';
// import 'package:sia_layout/signin.dart';
// import 'package:sia_layout/signup.dart';
// import 'package:sia_layout/signup_screen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            Image(image: AssetImage('lib/images/welcomepage.png'),
            height: height *0.6,),

            Column(
              children: const [
                Text('Build To Read',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Color(0xFF2B8C97),
                      fontFamily: 'NunitoSans',
                  ),),
                Text('You hear, we read, iRead.',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Color(0xFF03181B),
                    fontFamily: 'NunitoSans',

                   ),
                  textAlign: TextAlign.center),
              ],
            ),

          SizedBox(height: 10,),

            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignIn()));
                },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      side: BorderSide(color: Color(0xFF2B8B97)),
                      foregroundColor: (Color(0xFF2B8B97)),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    child:
                    Text('Login'.toUpperCase())), ),
                SizedBox( width: 10.0,),
                Expanded(child:  ElevatedButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      side: BorderSide(color: Color(0xFF2B8B97)),
                      foregroundColor: Colors.white,
                      backgroundColor: (Color(0xFF2B8B97)),
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                    child:
                    Text('Signup'.toUpperCase())),)

              ],
            )
          ],
        ),
      ),
    );
  }
}
