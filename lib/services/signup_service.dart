import 'package:dio/dio.dart';
import '../model/register_model.dart';

class DioFunction {
  Future<RegisterModel?> postData({RegisterModel? registerModel}) async {
    var url = 'https://139.59.79.228/flutter-api/public/api/register';

    try {
      Response response = await Dio().post(url, data: registerModel!.data);
      if (response.statusCode == 200) {
        var result = RegisterModel.fromJson(response.data);
        print(response.data);
        return result;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
