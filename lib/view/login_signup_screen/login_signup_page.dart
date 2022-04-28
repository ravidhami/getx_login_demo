import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login_screen/login_page.dart';
import '../sign_up/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 26, top: 83),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome,",
                        style: GoogleFonts.marmelad(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                            fontSize: 36)),
                    Text("Please Login OR Signup",
                        style: GoogleFonts.marmelad(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                            fontSize: 18)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 166),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Get.to(LoginPage()),
                        child: Container(
                          height: 54,
                          width: 303,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text("LOGIN",
                                style: GoogleFonts.marmelad(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF000000),
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      InkWell(
                        onTap: () => Get.to(SignUpPage()),
                        child: Container(
                          height: 54,
                          width: 303,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text("SIGN UP",
                                style: GoogleFonts.marmelad(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF000000),
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                    ],
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
