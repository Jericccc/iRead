import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit_example/signup_controller.dart';
// import 'package:sia_layout/signup_controller.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  static final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());


    return Container(
      padding: const EdgeInsets.symmetric(vertical:  10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  label: Text('Full Name'),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height:  20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  label: Text('Email'), prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                  label: Text('Phone Number'), prefixIcon: Icon(Icons.numbers)),
            ),
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
                    SignUpController.instance.registerUser(controller.email.text.trim(),
                    controller.password.text.trim());

                  }
                },
                child: Text('SignUp'.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}