import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_example/signin_controller.dart';
// import 'package:sia_layout/signin_controller.dart';
// import 'package:sia_layout/signup_controller.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({Key? key}) : super(key: key);

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  static final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());


    return Container(
      padding: const EdgeInsets.symmetric(vertical:  10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  label: Text('Email'), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: 20),

            const SizedBox(height:20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                  label: Text('Password'), prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    SignInController.instance.loginUser(controller.email.text.trim(),
                        controller.password.text.trim());

                  }
                },
                child: Text('Login'.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}