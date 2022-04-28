import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/register_model.dart';
import '../services/signup_service.dart';

class SignupController extends GetxController {

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> dropDownFormKey = GlobalKey<FormState>();
  String? selectedValue;
  String? selectedGender;

  List<String> gender = [
    'Male',
    'Female',
  ];

  TextEditingController dobController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();
  RegisterModel? registerModel;

  Future<RegisterModel?>addData()async{
    registerModel = await DioFunction().postData(
      registerModel: RegisterModel(
        data: Data(
          name: nameController.text,
          email: emailController.text,
          password: passController.text,
          password_confirmation: conpassController.text,
         birthDate: DateTime.parse(dobController.text),
          gender: selectedGender
        )
      )
    );
  }



   select(String valu) {
    selectedGender = valu;
    update();
  }

  selectDate(String date) {
    dobController.text = date;
    update();
  }
}
