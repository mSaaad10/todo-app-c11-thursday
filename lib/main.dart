import 'package:flutter/material.dart';
import 'package:todo_c11_thursday/core/app_routes.dart';
import 'package:todo_c11_thursday/core/theme/app_theme.dart';
import 'package:todo_c11_thursday/ui/auth/login/login_screen.dart';
import 'package:todo_c11_thursday/ui/auth/register/register_screen.dart';
import 'package:todo_c11_thursday/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      onGenerateRoute: (settings) {
        print(settings.name);
        switch (settings.name) {
          case AppRoutes.homeRoute:
            {
              return MaterialPageRoute(
                builder: (context) => HomeScreen(),
              );
            }
          case AppRoutes.registerRoute:
            {
              return MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              );
            }
          case AppRoutes.loginRoute:
            {
              return MaterialPageRoute(
                builder: (context) => LoginScreen(),
              );
            }
        }
      },
      initialRoute: AppRoutes.loginRoute,
    );
  }
}
