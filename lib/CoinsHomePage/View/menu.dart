import 'package:crypto_land/CoinsHomePage/View/ProfilePage.dart';
import 'package:crypto_land/Screens/ReferralScreen.dart';
import 'package:crypto_land/Screens/SettingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/RewardsScreen.dart';

class MyFocusedMenu extends StatelessWidget {
  const MyFocusedMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      openWithTap: true,
      menuWidth: MediaQuery.of(context).size.width * 0.50,
      animateMenuItems: true,
      blurBackgroundColor: Colors.black,
      blurSize: 4,
      menuBoxDecoration: BoxDecoration(color: Colors.black),
      menuItems: [
        FocusedMenuItem(
            backgroundColor: Colors.cyanAccent,
            title: Text(
              "Settings",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            trailingIcon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(SettingsPage());
            }),
        FocusedMenuItem(
            backgroundColor: Colors.cyanAccent,
            title: Text(
              "Refer",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            trailingIcon: Icon(Icons.share),
            onPressed: () {

              Get.to(MyReferralScreen());
            }),
        FocusedMenuItem(
            backgroundColor: Colors.cyanAccent,
            title: Text(
              "My Rewards",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            trailingIcon: Icon(
              Icons.grade_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Get.to(RewardsScreen());
            }),

        FocusedMenuItem(
            backgroundColor: Colors.cyanAccent,
            title:
        Text(
          "My Profile",
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
            trailingIcon: Icon(
              Icons.person,
              color: Colors.black,
            ), onPressed: (){

          Get.to(ProfilePage());
        })
      ],
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.cyanAccent,
            borderRadius: BorderRadius.circular(12)),
        height: 35,
        width: 35,
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }
}
