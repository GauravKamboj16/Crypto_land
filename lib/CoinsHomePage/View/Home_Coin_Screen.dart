import 'dart:convert';
import 'dart:math';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:crypto_land/CoinDetails/View/CoinDetailScreen.dart';
import 'package:crypto_land/CoinsHomePage/Controller/HomeController.dart';
import 'package:crypto_land/CoinsHomePage/View/MarketDetails.dart';
import 'package:crypto_land/CoinsHomePage/View/Shimmer.dart';

import 'package:crypto_land/Screens/ItemDesign.dart';
import 'package:crypto_land/Screens/RewardsScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:popup_menu_2/popup_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:unicons/unicons.dart';

import '../../Screens/DepositMoney.dart';
import '../../Screens/ReferralScreen.dart';
import '../../Screens/SettingScreen.dart';
import 'MyWallet.dart';
import 'menu.dart';

class MyCoinsHomeScreen extends StatefulWidget {
  const MyCoinsHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyCoinsHomeScreen> createState() => _MyCoinsHomeScreenState();
}

class _MyCoinsHomeScreenState extends State<MyCoinsHomeScreen> {
  DateTime pre_backpress = DateTime.now();
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
    return WillPopScope(
      onWillPop: () async{
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if(cantExit){
          //show snackbar
          final snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;
        }else{
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.deepPurple[800],
        // appBar: AppBar(
        //   title: Text("Api through Getx"),
        // ),
        body:

        _activeIndex==0?
            MarketDetails():



             MyWalletPage.nav(id),

        bottomNavigationBar: CurvedNavigationBar(
            items: itemList,
          backgroundColor:Colors.transparent,
          //Color(0xff4527a0),
            buttonBackgroundColor: Colors.white,
        color: Color(0xFf311B92),
        // color:Color(0xFf311B92),
        index: _activeIndex,
        onTap: ItemClick,
        height: 50,
      ),),
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
        print(dVlaue.toString() +" and "+totalBalance.toString());
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
}

void openMenu() {
  List<String> itemList = ["One", "two", "Three"];
}
