import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:login_demo/controller/signup_controller.dart';
import '../login_screen/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(
                    "assets/images/signupbackground.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 83),
                child: Container(
                  child: Text("Welcome",
                      style: GoogleFonts.marmelad(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFFFFFFFF),
                          fontSize: 36)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 196),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 608,
                  decoration: const BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(60),
                        topLeft: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 13,
                          ),
                          Text("SignUp",
                              style: GoogleFonts.marmelad(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF555555),
                                  fontSize: 24)),
                          const SizedBox(
                            height: 23,
                          ),
                          Form(
                            key: signupController.signUpFormKey,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: signupController.nameController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Your Name",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFF888888))),
                                    labelStyle:
                                        const TextStyle(color: Color(0xFF888888)),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your Name';
                                    }
                                  },
                                  cursorColor: const Color(0xFF888888),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: signupController.emailController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Your Email",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFF888888))),
                                    labelStyle: const TextStyle(
                                        color: const Color(0xFF888888)),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your Email';
                                    }
                                  },
                                  cursorColor: const Color(0xFF888888),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: signupController.passController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Password",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFF888888))),
                                    labelStyle: const TextStyle(
                                        color: const Color(0xFF888888)),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your Password';
                                    }
                                  },
                                  cursorColor: const Color(0xFF888888),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: signupController.conpassController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    labelText: "Confirm Password",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFF888888))),
                                    labelStyle: const TextStyle(
                                        color: const Color(0xFF888888)),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter your Confirm Password';
                                    }
                                    if (val !=
                                        signupController.passController.text) {
                                      return 'Not Match';
                                    }
                                  },
                                  cursorColor: const Color(0xFF888888),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: DropdownButtonFormField(
                                      key: signupController.dropDownFormKey,
                                      value: signupController.selectedGender,
                                      decoration: InputDecoration(
                                        hintText: 'Gender',
                                        hintStyle: const TextStyle(
                                            color: Color(0xFF888888)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      items: signupController.gender
                                          .map((String val) => DropdownMenuItem(
                                                child: Text(val),
                                                value: val,
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        signupController.select(value.toString());
                                      },
                                      validator: (val) {
                                        if (signupController.selectedGender ==
                                            null) {
                                          return 'Select your Gender';
                                        } else {
                                          return null;
                                        }
                                      },
                                    )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        controller:
                                            signupController.dobController,
                                        cursorColor: Colors.grey,
                                        onTap: () async {
                                          DateTime? pickData =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1950),
                                            lastDate: DateTime(2050),
                                          );
                                          if (pickData != null) {
                                            String formateDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickData);

                                            signupController
                                                .selectDate(formateDate);
                                          }
                                        },
                                        decoration: InputDecoration(
                                          focusColor: Colors.grey,
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: Colors.grey)),
                                          suffixIcon: const Icon(
                                            Icons.calendar_today,
                                            color: Colors.grey,
                                          ),
                                          hintText: 'Date of Birth',
                                          hintStyle: const TextStyle(
                                              color: const Color(0xFF888888)),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Please enter your dob";
                                          }
                                          return null;
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (signupController
                                        .signUpFormKey.currentState!
                                        .validate()) {
                                      Get.offAll(LoginPage());
                                    }
                                    signupController.addData();
                                  },
                                  child: Container(
                                    height: 54,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF555555),
                                        borderRadius: BorderRadius.circular(50)),
                                    child: Center(
                                      child: Text("SignUp",
                                          style: GoogleFonts.marmelad(
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: 18)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "You have account ? ",
                                      style: GoogleFonts.marmelad(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF444444),
                                          fontSize: 12)),
                                  TextSpan(
                                      text: "login",
                                      style: GoogleFonts.marmelad(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.orange,
                                          fontSize: 12),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap =
                                            () => Get.off(const LoginPage())),
                                ])),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
