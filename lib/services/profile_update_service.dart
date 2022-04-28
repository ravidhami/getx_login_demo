import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_demo/model/profileupdate_model.dart';

class ProfileUService {
  Future<UserProfileModel?> profileData(
      {UserProfileModel? userProfileModel, filepath}) async {
    var url =
        'https://139.59.79.228/flutter-api/public/api/profileUpdate/${userProfileModel!.user!.id}';
    final box = GetStorage();
    Dio dio = Dio();
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(filepath, filename: 'dp'),
      });

      var token = box.read('token');
      dio.options.headers["Authorization"] = "Bearer $token";

      Response response = await dio
          .post(url,
          data: formData,
          queryParameters: {"_method": "PUT"});
      if (response.statusCode == 200) {
        var result = UserProfileModel.fromJson(response.data);
        print(response.data);
        return result;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
