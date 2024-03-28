import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_api_and_provider/view/home_screen.dart';
import 'package:mvvm_architecture_with_api_and_provider/view/login_screen.dart';
import 'package:mvvm_architecture_with_api_and_provider/view/signup_screen.dart';

class Routes{
  static const String home = 'home';
  static const String login = 'login';
  static const String signUp = 'signUp';

  MaterialPageRoute? generateRoute(RouteSettings settings){
    switch(settings.name){
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}