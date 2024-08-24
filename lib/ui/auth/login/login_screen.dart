import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_c11_thursday/core/app_routes.dart';
import 'package:todo_c11_thursday/core/utils/dialog_utils.dart';
import 'package:todo_c11_thursday/core/utils/email_validation.dart';
import 'package:todo_c11_thursday/ui/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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

                Text('E-mail', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),),

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
                Text('Password', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),),

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

                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: () {
                      login(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: Text('Login')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account ?",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.registerRoute);
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login({required String email, required String password}) async {
    if (formKey.currentState?.validate() == false) {
      return;
    }

    // authenticate

    try {
      DialogUtils.showLoadingDialog(context, 'Plz, wait...');
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password); //
      DialogUtils.hideDialog(context);
      DialogUtils.showMessageDialog(context, 'User logged in successfully',
          posActionTitle: 'Ok', posAction: () {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
      }, dismissible: false);

      print('User Id is: ${userCredential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      DialogUtils.hideDialog(context);
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        DialogUtils.showMessageDialog(context, 'Wrong email or password',
            posActionTitle: 'Try again');
      }
    }
  }
}
