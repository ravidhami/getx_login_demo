import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_demo/model/productdetail_model.dart';

class ProductDetailService {
  Future<ProductDetailModel> fetchData(int id) async {
    final box = GetStorage();
    Dio dio = Dio();
    var url = 'https://139.59.79.228/flutter-api/public/api/products';
    try {
      var token = box.read('token');
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio
          .get('https://139.59.79.228/flutter-api/public/api/products/280');
      print(response.statusCode);
      ProductDetailModel? productDetailModel =
          ProductDetailModel.fromJson(response.data);
      return productDetailModel;
    } catch (e) {
      throw e.toString();
    }
  }
}
