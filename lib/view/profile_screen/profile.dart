import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:login_demo/controller/profile_controller.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF555555),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFFFFFFF),
            )),
        title: Text("Edit Profile",
            style: GoogleFonts.marmelad(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF),
                fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child:
        profileController.userProfileModel==null? CircularProgressIndicator():
        Column(
          children: [
            Container(
              height: 225,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF555555),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  Stack(
                    children: [
                     CircleAvatar(
                          radius: 50,
                          backgroundImage: profileController
                                      .pickedFile != null
                              ? FileImage(
                                      File(profileController.pickedFile!.path))
                                  as ImageProvider
                              : const AssetImage('assets/images/profile.png'),
                        ),
                      Positioned(
                        top: 65,
                        left: 75,
                        child: InkWell(
                          onTap: () {
                            print("ok");
                            Get.bottomSheet(
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Choose Profile Photo",
                                            style: GoogleFonts.marmelad(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 24)),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      profileController
                                                          .selectPhoto(
                                                              ImageSource
                                                                  .camera);
                                                    },
                                                    icon: Icon(
                                                      Icons.camera_alt_outlined,
                                                      size: 50,
                                                      color: Color(0xFFFFFFFF),
                                                    )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text("Camera",
                                                    style: GoogleFonts.marmelad(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontSize: 24)),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      profileController
                                                          .selectPhoto(
                                                              ImageSource
                                                                  .gallery);
                                                    },
                                                    icon: Icon(
                                                      Icons.photo_library,
                                                      size: 50,
                                                      color: Color(0xFFFFFFFF),
                                                    )),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text("Gallery",
                                                    style: GoogleFonts.marmelad(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xFFFFFFFF),
                                                        fontSize: 24)),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                backgroundColor: Color(0xFF444444));
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFFFFFFF),
                            radius: 12,
                            child: Icon(
                              Icons.edit,
                              size: 15,
                              color: Color(0xFF444444),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(profileController.userProfileModel!.user!.name!,
                      style: GoogleFonts.marmelad(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                          fontSize: 18)),
                  Text(profileController.userProfileModel!.user!.email!,
                      style: GoogleFonts.marmelad(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFCBCBCB),
                          fontSize: 12)),
                  //Text(profileController.userProfileModel!.user!.id!.toString()),
                  SizedBox(
                    height: 33,
                  ),
                ],
              ),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.only(left: 38, right: 38, top: 48),
                child: Column(
                  children: [
                    TextFormField(
                      controller: profileController.editName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: "User Name",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF888888))),
                        labelStyle: TextStyle(color: Color(0xFF888888)),
                        suffixIcon: Icon(Icons.edit, color: Color(0xFF888888)),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter your email';
                        }
                      },
                      cursorColor: Color(0xFF888888),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: profileController.editEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(5)),
                        labelText: "user123@gmail.com",
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF888888))),
                        labelStyle: TextStyle(color: Color(0xFF888888)),
                        suffixIcon: Icon(Icons.edit, color: Color(0xFF888888)),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter your email';
                        }
                      },
                      cursorColor: Color(0xFF888888),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    DropdownButtonFormField(
                      value: profileController.selectedGender,
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        hintStyle: const TextStyle(color: Color(0xFF888888)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      items: profileController.gender
                          .map((String val) => DropdownMenuItem(
                                child: Text(val),
                                value: val,
                              ))
                          .toList(),
                      onChanged: (value) {
                        profileController.select(value.toString());
                      },
                      validator: (val) {
                        if (profileController.selectedGender == null) {
                          return 'Select your Gender';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: profileController.editDob,
                      cursorColor: Colors.grey,
                      onTap: () async {
                        DateTime? pickData = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050),
                        );
                        if (pickData != null) {
                          String formateDate =
                              DateFormat('dd-MM-yyyy').format(pickData);
                          profileController.selectDate(formateDate);
                        }
                      },
                      decoration: InputDecoration(
                        focusColor: Colors.grey,
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        hintText: 'Date of Birth',
                        hintStyle:
                            const TextStyle(color: const Color(0xFF888888)),
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please enter your dob";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    InkWell(
                      onTap: (){
                        profileController.updateProfile();
                      },
                      child: Container(
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color(0xFF555555),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text("Save Changes",
                              style: GoogleFonts.marmelad(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFFFFFFF),
                                  fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
