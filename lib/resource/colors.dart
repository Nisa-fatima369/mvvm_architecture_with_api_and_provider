
import 'package:flutter/material.dart';

class AppColors{
  static AppColors? _instance;
  factory AppColors() => _instance ??= AppColors._();

  AppColors._();

  static const black = Color.fromARGB(255, 0, 0, 0);
  static const white = Color(0xffF2F2F2);
  static const primary = Color.fromARGB(255, 16, 107, 13);

}