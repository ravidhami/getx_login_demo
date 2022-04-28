import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_demo/view/product_screen/product_detail.dart';
import '../../controller/productlist_controller.dart';
import '../../controller/profile_controller.dart';
import '../profile_screen/profile.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          title: Text("Product List",
              style: GoogleFonts.marmelad(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                  fontSize: 24)),
          centerTitle: true,
          backgroundColor: Color(0xFF555555),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: (){
                  profileController.editName.text = profileController.userProfileModel!.user!.name!;
                  profileController.editEmail.text = profileController.userProfileModel!.user!.email!;
                  profileController.editgender.text = profileController.userProfileModel!.user!.gender!;
                  profileController.editDob.text = profileController.userProfileModel!.user!.birthDate!;
                  Get.to(Profile());
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
            )
          ],
        ),
        body: GetBuilder<ProductListController>(
          init: ProductListController(),
          builder: (controller) {
            return controller.productList == null
                ? Container()
                : ListView.builder(
                    itemCount: controller.productList!.data!.data!.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(Product_detail(
                            datum: controller.productList!.data!.data![index],
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 27,right: 27),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                                height: 94,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Color(0xFFDDDDDD)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Container(
                                              height: 85,
                                              width: 90,
                                              child: Image.asset(
                                                  'assets/images/play.png')),
                                        ),
                                        // Image.asset('assets/images/img.png'),

                                        Container(
                                          margin:
                                              EdgeInsets.only(left: 24, top: 10),
                                          height: 70,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/img.png'),
                                          )),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 98, top: 21),
                                          child: Column(
                                            children: [
                                              Text("Bluetooth Headphones",
                                                  style: GoogleFonts.marmelad(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                      fontSize: 18)),
                                              Text("Price : 100\$",
                                                  style: GoogleFonts.marmelad(
                                                      fontStyle: FontStyle.normal,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF444444),
                                                      fontSize: 18)),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 40),
                                      child: Container(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 19,
                                              width: 44,
                                              color: Color(0xFFAC0000),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text("Sell",
                                                      style: GoogleFonts.marmelad(
                                                          fontStyle:
                                                          FontStyle.normal,
                                                          fontWeight:
                                                          FontWeight.w400,
                                                          color:
                                                          Color(0xFFFFFFFF),
                                                          fontSize: 12)),
                                                ),
                                              ),
                                              //Image.asset('assets/images/play.png'),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 15,
                                              child: Image.asset(
                                                  'assets/images/play.png'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
