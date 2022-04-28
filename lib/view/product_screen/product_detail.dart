import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_demo/model/product_model.dart';
import '../../controller/productlist_controller.dart';

class Product_detail extends StatefulWidget {
  Datum? datum;
  Product_detail({this.datum});

  @override
  _Product_detailState createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {
  final controller = Get.put(ProductListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Text("Product Details",
            style: GoogleFonts.marmelad(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF),
                fontSize: 24)),
        centerTitle: true,
        backgroundColor: Color(0xFF555555),
      ),
      body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Container(
                    height: 122,
                    width: 157,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/detailimg.png'))),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
              Padding(
                padding:
                const EdgeInsets.only(top: 27, left: 43, right: 43),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bluetooth Headphones",
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF444444),
                              fontSize: 18)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Price : ${widget.datum!.mrp!.toString()}",
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF888888),
                              fontSize: 14)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Highlights",
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF444444),
                              fontSize: 18)),
                      Text(controller.highlights,
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF666666),
                              fontSize: 12)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text("Colors",
                              style: GoogleFonts.marmelad(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF444444),
                                  fontSize: 18)),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFFF0000)),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFF0000FF)),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFFC4C4C4)),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xFF000000)),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text("Description",
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF444444),
                              fontSize: 18)),
                      Text(controller.description,
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF666666),
                              fontSize: 12)),
                      SizedBox(
                        height: 13,
                      ),
                      Text("Ratings",
                          style: GoogleFonts.marmelad(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF444444),
                              fontSize: 18)),
                      SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (contex, _) {
                          return Icon(
                            Icons.star,
                            color: Color(0xFFF7DE00),
                          );
                        },
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        itemSize: 30,
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (contex, _) {
                          return Icon(
                            Icons.star,
                            color: Color(0xFFF7DE00),
                          );
                        },
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
