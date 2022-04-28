import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_demo/model/login_model.dart';
import 'package:login_demo/services/login_service.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final store = GetStorage();

  LoginModel? loginModel;

  Future<LoginModel?> postData() async {
    loginModel = await LoginFunction().postData(
        loginModel: LoginModel(
      user:
          User(email: emailController.text, password: passwordController.text),
    ));
  }
}
