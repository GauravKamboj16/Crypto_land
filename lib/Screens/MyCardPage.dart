
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCardPAge extends StatelessWidget {
    MyCardPAge({Key? key}) : super(key: key);
  var name=Get.arguments.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text("My Cards",style: TextStyle(color: Colors.white),),
      ),

      body: SafeArea(
        child: Column(
          children: [
             CardDesign(context,name),
            Padding(padding: EdgeInsets.all(15),
            child:
            Text("Note:This is a fake card detail and has been made for practice purpose only!",style: GoogleFonts.poppins(color: Colors.white,),)
              ,),


          ],
        ),
      ),
    );
  }

  Widget CardDesign(BuildContext context,String name) {
    return Container(
      width: MediaQuery.of(context).size.width,
    //  height: MediaQuery.of(context).size.height/4,
      margin: EdgeInsets.all(20),


      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.amber,Colors.yellow],begin:Alignment.centerLeft,end: Alignment.bottomRight ),
        boxShadow: [
          BoxShadow(color: Colors.grey,offset: Offset(-1,1))
        ],
        borderRadius: BorderRadius.circular(14)
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 11, 12, 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Text("Crypto Land",style: GoogleFonts.lato(color: Colors.black,fontWeight: FontWeight.w800,fontSize: 16),),
            ),
          ),
          Image.asset("assets/images/chip.png",height: 40,width: 60,),
            SizedBox(height: 10,),
            Center(child: Text("1624 2234 4145 ****",style: GoogleFonts.poppins(color: Colors.blue,fontSize: 24,fontWeight: FontWeight.w500,),)),
             SizedBox(height: 10,),
      Align(alignment: Alignment.bottomLeft,
               child: Text("$name",style: GoogleFonts.poppins(color: Colors.black,fontSize: 16),),
             )
            
        ],),
        
      ),
      
      
    );

  }
}
