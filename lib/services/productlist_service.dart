import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../model/product_model.dart';

class ProductListService{
  Future<ProductList?> getData()async{

    final box = GetStorage();
    Dio dio = Dio();
    var url = 'https://139.59.79.228/flutter-api/public/api/products';

    try{
      var token = box.read('token');
      //print("conform${box.read('token')}");
      dio.options.headers["Authorization"] = "Bearer $token";
      Response response = await dio.get(url);
      print(response.data);
      print(response.statusCode);
      var productList = ProductList.fromJson(response.data);
      return productList;
    }catch(e){
      throw e.toString();
    }
  }
}