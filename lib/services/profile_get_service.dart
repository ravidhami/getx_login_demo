import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../model/profileupdate_model.dart';

class ProfileGetService {
  Future<UserProfileModel?> fetchData() async {
    final box = GetStorage();
    Dio dio = Dio();
    var url = 'https://139.59.79.228/flutter-api/public/api/getUserProfile';
    try {
      var token = box.read('token');
      //print("conform${box.read('token')}");
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.get(url);
      print(response.data);
      print(response.statusCode);
      var getProfile = UserProfileModel.fromJson(response.data);
      return getProfile;
    } catch (e) {
      throw e.toString();
    }
  }
}
