import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  bool isEmpty=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[800],
        title: Text("Settings",style: TextStyle(color: Colors.white),),
      ),
      body:
      isEmpty==true?
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            child:Image.asset("assets/images/no_rewards.webp")
          ),
          Text(textAlign: TextAlign.center,"Oops! looks like you do not have any rewards yet",style: GoogleFonts.poppins(color: Colors.deepPurple,fontSize: 16
              ,fontWeight: FontWeight.w600),)
        ],
      ):Container(),
    );
  }
}
