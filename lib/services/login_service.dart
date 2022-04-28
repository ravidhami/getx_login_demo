import 'package:dio/dio.dart';
import 'package:login_demo/model/login_model.dart';

class LoginFunction {
  Future<LoginModel?> postData({LoginModel? loginModel}) async {
    var url = 'https://139.59.79.228/flutter-api/public/api/login';
    try {
      Response response = await Dio().post(
        url,
        data: loginModel!.user,
      );
      if (response.statusCode == 200) {
        var result = LoginModel.fromJson(response.data);
        print(response.data);
        return result;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
