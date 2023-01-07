import 'package:crypto_land/CoinsHomePage/View/Home_Coin_Screen.dart';
import 'package:crypto_land/CoinsHomePage/View/ProfilePage.dart';
import 'package:crypto_land/Screens/ImageTest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BuyCoins/View/BuyCoin.dart';
import 'CoinDetails/View/CoinDetailScreen.dart';
import 'LoginPage/LoginScreen.dart';
import 'Screens/DepositMoney.dart';

import 'Screens/MyCardPage.dart';
import 'Screens/MyCoinScreen.dart';
import 'SellCoin/View/SellCoinScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // This is the last thing you need to add.
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),   initialRoute: '/',
      routes: {
        '/':(context)=>MyLoginScreen(),
        "/homeScreen":(context)=>MyCoinsHomeScreen(),
        "/coinDetails":(context)=>DetailedCoinScreen(),
        "/buyCoinsPage":(context)=>BuyCoinScreen(),
        "/sellCoinsPage":(context)=>SellCoinScreen(),
        "/MyCardsPage":(context)=>MyCardPAge()
      },
    );
  }
}
