import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_demo/controller/login_controller.dart';
import '../product_screen/product_list.dart';
import '../sign_up/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/loginbackground.png"),
                fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26, top: 83),
              child: Container(
                child: Text("Welcome Back",
                    style: GoogleFonts.marmelad(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                        fontSize: 36)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 440,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 23, left: 38, right: 38),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text("Login",
                              style: GoogleFonts.marmelad(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF555555),
                                  fontSize: 24)),
                          SizedBox(height: 35),
                          Form(
                              key: loginController.loginFormKey,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Column(
                                children: [
                                  // email field
                                  TextFormField(
                                    controller: loginController.emailController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      labelText: "Your Email",
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF888888))),
                                      labelStyle:
                                          TextStyle(color: Color(0xFF888888)),
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Enter your email';
                                      }
                                    },
                                    cursorColor: Color(0xFF888888),
                                  ),
                                  SizedBox(height: 37),
                                  //password field
                                  TextFormField(
                                    controller:
                                        loginController.passwordController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      labelText: "Your Password",
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF888888))),
                                      labelStyle:
                                          TextStyle(color: Color(0xFF888888)),
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Enter your password';
                                      }
                                    },
                                    cursorColor: Color(0xFF888888),
                                  ),
                                  SizedBox(height: 22),
                                  // forgot passwword
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("Forgot Password ?",
                                        style: GoogleFonts.marmelad(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF555555),
                                            fontSize: 12)),
                                  ),
                                  SizedBox(height: 35),
                                  // login button
                                  GestureDetector(
                                    onTap: () async {
                                      if (loginController
                                          .loginFormKey.currentState!
                                          .validate()) {
                                        /* if (loginController
                                                .loginModel?.status ==
                                            true)*/
                                        await loginController.postData();
                                        loginController.store.write("token",
                                            loginController.loginModel!.token);
                                        Get.offAll(ProductList());
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "Enter Valide email and password"),
                                        ));
                                      }
                                    },
                                    child: Container(
                                      height: 54,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF555555),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Center(
                                        child: Text("Login",
                                            style: GoogleFonts.marmelad(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 18)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  //don't have account
                                  Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text: "Don't have account ? ",
                                        style: TextStyle(
                                            color: Color(0xFF444444))),
                                    TextSpan(
                                        text: "Sign up",
                                        style: TextStyle(color: Colors.orange),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =
                                              () => Get.off(SignUpPage())),
                                  ])),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),),
    );
  }
}
