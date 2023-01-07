import 'package:crypto_land/CoinDetails/Controller/DetailsController.dart';
import 'package:crypto_land/CoinsHomePage/View/Shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sparkline/sparkline.dart';

import '../../BuyCoins/View/BuyCoin.dart';
import 'ShimmerDetailsPage.dart';

class DetailedCoinScreen extends StatefulWidget {
  const DetailedCoinScreen({Key? key}) : super(key: key);

  @override
  State<DetailedCoinScreen> createState() => _MyCoinsHomeScreenState();
}

class _MyCoinsHomeScreenState extends State<DetailedCoinScreen> {
  late int index;
  DetailsController controller = Get.put(DetailsController.index(0));


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      index=Get.arguments ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      // appBar: AppBar(
      //   title: Text("Api through Getx"),
      // ),
      body: Obx(() =>
      controller.isLoading.value == true
          ? SafeArea(
        child: Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.deepPurple,
          child: DetailsPageShimmer(),
        ),
      )
          : SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Sparkline(
                                  data:(controller.cryptoModel!.data!.coins!.elementAt(index).sparkline)!.map(double.parse).toList(),
                                  fillMode: FillMode.below,
                                  gridLineColor: Colors.orange,
                                  fillColor: Colors.blue,
                                  pointsMode: PointsMode.all,
                                  pointSize: 5.0,
                                  lineColor: Colors.deepPurple[900],
                                  pointColor: Colors.amber,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                controller.cryptoModel!.data!.coins!.elementAt(
                                    index).symbol.toString(),
                                style: GoogleFonts.lato(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:(){
                               // Map<String,String>? nData = {
                               //    "name" : controller.cryptoModel!.data!.coins!.elementAt(index).name.toString(),
                               //   "symbol":controller.cryptoModel!.data!.coins!.elementAt(index).symbol.toString(),
                               //    "price" : controller.cryptoModel!.data!.coins!.elementAt(index).price.toString(),
                               //   "iconUrl":controller.cryptoModel!.data!.coins!.elementAt(index).iconUrl.toString(),
                               //  };
                                Get.toNamed("/buyCoinsPage",arguments: [
                                    {"name": controller.cryptoModel!.data!.coins!.elementAt(index).name.toString()},
                                    {"symbol": controller.cryptoModel!.data!.coins!.elementAt(index).symbol.toString()},
                                  {"price": controller.cryptoModel!.data!.coins!.elementAt(index).price.toString()},
                                  {"iconUrl": controller.cryptoModel!.data!.coins!.elementAt(index).iconUrl.toString()},

                                    ]);
                              },
                              child: Container(
                                height: 28,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.lightGreenAccent[700]),
                                child: Center(
                                    child: Text(
                                      "Buy",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    )),
                              ),
                            ),
                            Container(
                              height: 28,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.lightGreenAccent[700]),
                              child: Center(
                                  child: Text(
                                      controller.cryptoModel!.data!.coins!
                                          .elementAt(index).change.toString() +
                                          "%",
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          controller.cryptoModel!.data!.coins!.elementAt(index)
                              .name
                              .toString(),
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "price",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          controller.cryptoModel!.data!.coins!.elementAt(index)
                              .price.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white38,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Market Cap",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(controller.cryptoModel!.data!.coins!.elementAt(
                            index)
                            .marketCap.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white38,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rank",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          controller.cryptoModel!.data!.coins!.elementAt(index)
                              .rank
                              .toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white38,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Listed At",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(controller.cryptoModel!.data!.coins!.elementAt(
                            index)
                            .listedAt.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white38,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "24 Hours Volume",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          controller.cryptoModel!.data!.coins!.elementAt(index)
                              .s24hVolume.toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.white38,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
      ),

    );
  }
}
