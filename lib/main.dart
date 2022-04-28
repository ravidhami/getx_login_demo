import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_demo/view/login_signup_screen/login_signup_page.dart';
import 'services/httpservice.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
