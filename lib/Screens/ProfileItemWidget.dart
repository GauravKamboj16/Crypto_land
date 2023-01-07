import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileWidget extends StatelessWidget {
   MyProfileWidget({Key? key}) : super(key: key);

  String ? leftItem;
  String ? rightItem;

  MyProfileWidget.items(this.leftItem, this.rightItem);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.deepPurple[900],
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  leftItem.toString(),
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontSize: 18),
                ),
                Text(
                  rightItem.toString(),
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ));
  }
}
