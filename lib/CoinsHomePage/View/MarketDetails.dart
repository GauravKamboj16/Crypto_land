import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import '../../Screens/DepositMoney.dart';
import '../../Screens/ItemDesign.dart';
import '../Controller/HomeController.dart';
import 'Home_Coin_Screen.dart';
import 'Shimmer.dart';
import 'menu.dart';

class MarketDetails extends StatefulWidget {
  const MarketDetails({Key? key}) : super(key: key);

  @override
  State<MarketDetails> createState() => _MarketDetailsState();
}

class _MarketDetailsState extends State<MarketDetails> {
  HomeController controller = Get.put(HomeController());
  late DatabaseReference db;
  var name, photoUrl, mail, id;
  int _activeIndex = 0;
  bool balanceLoading = true;
  var totalBalance;
  final itemList = [
    Icon(
      Icons.auto_graph_sharp,
      size: 30,
      color: Colors.orange,
    ),
    Icon(Icons.shopping_bag_sharp,
      size: 30,
      color: Colors.orange,)


  ];

  //TODO:Set user id to fetch total amount (hardcoded for now);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    db = FirebaseDatabase.instance.ref("App Data").child("Account Balance");

    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body:  Obx(() =>
      controller.isDataLoading.value == true
          ? Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.deepPurple,
        child: ItemShimmer(),
      )
          : RefreshIndicator(
        onRefresh: () => getTotalBalance(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Portfolio",
                              style: GoogleFonts.poppins(
                                  color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(MoneyDepositPage()),
                              child: Text(
                                balanceLoading == true
                                    ? "Loading...."
                                    : "$totalBalance" + "\$",
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 23),
                              ),
                            ),
                            Text(
                              "^ Click here to deposit Money!",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                openNotiFicationPanel(),
                SizedBox(
                  width: 25,
                ),
                InkWell(
                    onTap: () {
                      openMenu();
                    },
                    child: MyFocusedMenu()),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    controller.crypto_model!.data!.coins!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Get.to(MyCoinsHomeScreen(), arguments: [
                              {
                                "index": controller
                                    .crypto_model!.data!.coins!
                                    .elementAt(index)
                                    .toString()
                              },
                              // {"second": 'Second data'}
                            ]);
                          },

                          child: ItemDesign.design(
                              controller.crypto_model, index));
                    }),
              ),
            )
          ],
        ),
      )),
    );
  }
  Future<void> fetchBalance() async {
    var url =
        "https://console.firebase.google.com/u/4/project/crypto-land-4764b/database/crypto-land-4764b-default-rtdb/data/~2F" +
            "data.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print("Hello hi tjere");
      print(extractedData.toString() + "hiiiiiiiiiiiiiii");
      setState(() {});
    } catch (error) {
      throw error;
    }
  }

  Future<void> getTotalBalance() async {
    final dbReff =
    FirebaseDatabase.instance.ref("App Data").child("Account Balance");
    final snapshot = await dbReff.child(id).get();
    if (snapshot.exists) {
      print(snapshot.value);
      print((snapshot.value).toString() + "gaurav Kamboj");

      setState(() {
        double dVlaue=double.parse(snapshot.value.toString());
        totalBalance =   double.parse(dVlaue.toStringAsFixed(3));
        balanceLoading = false;
      });
    } else {
      final dbReff =
      FirebaseDatabase.instance.ref("App Data").child("Account Balance");
      final snapshot = await dbReff.child(id).set("0.00").whenComplete(() {
        setState(() {
          getTotalBalance();
        });
      });

      print('No data available.');
    }
  }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      name = preferences.getString("userName")!;
      photoUrl = preferences.getString("photo")!;
      mail = preferences.getString("email")!;
      id = preferences.getString("id")!;
      getTotalBalance();
    });
  }

  void ItemClick(int value) {
    setState(() {
      _activeIndex = value;
    });
  }

  Widget openNotiFicationPanel() {
    return  FocusedMenuHolder(
      openWithTap: true,
      menuWidth: MediaQuery.of(context).size.width * 0.60,
      animateMenuItems: true,
      blurBackgroundColor: Colors.black,
      blurSize: 4,
      menuBoxDecoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      menuItems: [
        FocusedMenuItem(title: Text(textAlign: TextAlign.center,"Nothing here\!",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600, fontSize: 15),),
            onPressed: (){}),
        FocusedMenuItem(title: Text(" "),
            onPressed: (){}),FocusedMenuItem(title: Text(" "),
            onPressed: (){}),FocusedMenuItem(title: Text(" "),
            onPressed: (){}),FocusedMenuItem(title: Text(" "),
            onPressed: (){}),FocusedMenuItem(title: Text(" "),
            onPressed: (){}),


      ],
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
          

            borderRadius: BorderRadius.circular(12)),

        child: Icon(
          Icons.notifications_outlined,
          color: Colors.white,
        ),
      ),
    );

  }
}
