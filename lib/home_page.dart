import 'package:flutter/material.dart';
// import 'package:google_ml_kit_example/scanpage.dart';
import 'package:google_ml_kit_example/util/main.dart';

import 'authentication_repository.dart';
import 'homepage1.dart';
// import 'package:sia_layout/authentication_repository.dart';
//
// import 'package:sia_layout/scanpage.dart';
class HomePage extends StatefulWidget{
  const HomePage ({Key? key}) : super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();
}
  class _HomePageState extends State<HomePage>{
    void Home(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return HomePage2();
      }));
    }
  @override
    Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF93D9E1),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(

                      children: const [
                        SizedBox(height: 10),
                        Text('iRead',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white
                        ),
                        )
                      ],

                    ),
                    SizedBox(height: 190),
                    Container(

                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: IconButton(onPressed:(){
                        AuthenticationRepository.instance.logout();
                      }, icon: (Icon(Icons.person, color: Colors.white)),
                    ),
                    ),
                  ],
                ),
            ),


            Container(

              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
              ),
              ),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Library',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  //addnewbutton
                  Container(
                    child: Center(
                      child: Text('+Add new',
                          style: TextStyle(color: Color(0xFF10A8B9),
                          fontSize: 16
                          ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //anotherwhitecontainer
            Container(
              height: 452,
              decoration: BoxDecoration(color: Colors.white)

              ),


            ],

          ),

      ),
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FittedBox(
          child: FloatingActionButton(
            child: Icon(Icons.center_focus_weak_outlined,
            size: 40,),
            onPressed: () {

              Home(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))
            ),
            backgroundColor: (Color(0xFF92D9E1)),
          ),
        )

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
  }