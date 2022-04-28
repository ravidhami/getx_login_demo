/*
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_demo/services/profile_get_service.dart';
import 'package:login_demo/services/profile_update_service.dart';
import '../model/profileupdate_model.dart';
import '../model/register_model.dart';

class ProfileController extends GetxController {
  String? selectedGender;

  TextEditingController editDob = TextEditingController();
  TextEditingController editName = TextEditingController();
  TextEditingController editEmail = TextEditingController();
  TextEditingController editgender = TextEditingController();
  RegisterModel? registerModel;
  UserProfileModel? userProfileModel;
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  var isprofilPathSet = false.obs;
  var profilePath = ''.obs;

  Future<void> selectPhoto(ImageSource imageSource) async {
    final pickedImage = await imagePicker.pickImage(source: imageSource);

    pickedFile = File(pickedImage!.path);
    setProfileImagePath(pickedImage.path);
  }

  void setProfileImagePath(String pathe) {
    profilePath.value = pathe;
    isprofilPathSet.value = true;
  }

  List<String> gender = [
    'Male',
    'Female',
  ];
  select(String valu) {
    selectedGender = valu;
    update();
  }

  selectDate(String date) {
    editDob.text = date;
    update();
  }

  Future<UserProfileModel?> updateProfile() async {
    userProfileModel = await ProfileUService().profileData(
        userProfileModel: UserProfileModel(
            user: User(
      email: editEmail.text,
      name: editName.text,
      gender: editgender.text,
      birthDate: editDob.text,
              image: pickedFile!.toString(),
    )));
  }

  void showData() async {
    userProfileModel = await ProfileGetService().fetchData();
    update();
  }

  @override
  void onInit() {
    showData();
    super.onInit();
  }
}
*/

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_demo/services/profile_get_service.dart';
import 'package:login_demo/services/profile_update_service.dart';
import '../model/profileupdate_model.dart';
import '../model/register_model.dart';

class ProfileController extends GetxController {
  String? selectedGender;

  TextEditingController editDob = TextEditingController();
  TextEditingController editName = TextEditingController();
  TextEditingController editEmail = TextEditingController();
  TextEditingController editgender = TextEditingController();
  RegisterModel? registerModel;
  UserProfileModel? userProfileModel;
  XFile? pickedFile;
  ImagePicker imagePicker = ImagePicker();


  Future<void> selectPhoto(ImageSource imageSource) async {
    final pickedImage = await imagePicker.pickImage(source: imageSource);

    pickedFile = pickedImage;
    update();
  }

  List<String> gender = [
    'Male',
    'Female',
  ];
  select(String valu) {
    selectedGender = valu;
    update();
  }

  selectDate(String date) {
    editDob.text = date;
    update();
  }

  Future<UserProfileModel?> updateProfile() async {

    userProfileModel = await ProfileUService().profileData(filepath: pickedFile!.path,
        userProfileModel: UserProfileModel(
            user: User(
              email: editEmail.text,
              name: editName.text,
              gender: editgender.text,
              birthDate: editDob.text,
              //image: pickedFile!.path
            )));
  }

  void showData() async {
    userProfileModel = await ProfileGetService().fetchData();
    update();
  }

  @override
  void onInit() {
    showData();
    super.onInit();
  }
}
