import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_c11_thursday/core/utils/email_validation.dart';
import 'package:todo_c11_thursday/ui/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
  TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blue.shade900,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // SizedBox(height: 100,),
                SvgPicture.asset('assets/images/auth_logo.svg'),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Full Name',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                CustomTextFormField(
                  controller: fullNameController,
                  hint: 'Full Name',
                  keyboardType: TextInputType.name,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter Full Name';
                    }
                    if (input is int) {
                      return 'Sorry, Invalid input';
                    }
                    return null;
                  },
                ),
                Text(
                  'User Name',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),

                CustomTextFormField(
                  controller: userNameController,
                  hint: 'User Name',
                  keyboardType: TextInputType.name,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz, enter User Name';
                    }
                    return null;
                  },
                ),
                Text(
                  'E-mail',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),

                CustomTextFormField(
                  controller: emailController,
                  hint: 'E-mail Address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz enter e-mail address';
                    }
                    if (!isValidEmail(input)) {
                      return 'Email bad format';
                    }
                    return null;
                  },
                ),
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),

                CustomTextFormField(
                  controller: passwordController,
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  isSecureText: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz enter password';
                    }
                    if (input.length < 6) {
                      return 'Sorry, Password should be at least 6 chars';
                    }
                    return null;
                  },
                ),
                Text(
                  'Confirm Password',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),

                CustomTextFormField(
                  controller: passwordConfirmationController,
                  hint: 're-password',
                  keyboardType: TextInputType.visiblePassword,
                  isSecureText: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return 'Plz enter password';
                    }
                    if (input != passwordController.text) {
                      return 'Password does not match';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      register(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register({required String email, required String password}) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    // create account

    try {
      var userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('USer ID is ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}
