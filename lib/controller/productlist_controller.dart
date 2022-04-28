import 'package:get/get.dart';
import 'package:login_demo/model/product_model.dart';
import 'package:login_demo/services/productlist_service.dart';
import 'package:get_storage/get_storage.dart';

class ProductListController extends GetxController {
  String highlights =
      'Power Output(RMS): 10 W\nBattery life: 12 hrs\nBluetooth Version:5\nWireless range: 10 m\nWireless music streaming via bluetooth\nIPX7: Splash and Sweat Shield\nMultiple Connectivity: BT,TF Card ans AUX';
  String description =
      'Its time to enjoy a seamless playback experience courtesy boAt Stone 350 10W portable wireless speaker.The speaker comes equipped with 1.96 dynamic drivers for an immersive stereo experience. It supports instant wireless connectivity with Bluetooth v5.0.';
  ProductList? productList;
  final data = GetStorage();
  double rating = 0;

  void showData() async {
    productList = await ProductListService().getData();
    update();
  }

  @override
  void onInit() {
    showData();
    super.onInit();
  }
}
