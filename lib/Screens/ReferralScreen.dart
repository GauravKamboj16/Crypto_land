import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyReferralScreen extends StatelessWidget {
  const MyReferralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text("Refer a friend",style: TextStyle(color: Colors.white),),
      ),

      body:SafeArea(
          child: Column(
        children: [
          //"assets/images/refer2.jpeg"
          Image.asset("assets/images/referNew.png",fit:BoxFit.cover  ,height: MediaQuery.of(context).size.height/3.2,width: MediaQuery.of(context).size.width,),
          Expanded(
              child: Card(

                shadowColor: Colors.deepPurple,
                elevation: 10,
            color: Colors.deepPurple,
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      Text(textAlign: TextAlign.center,"Refer your friends and get a chance to win BTC",style: GoogleFonts.poppins(color: Colors.white,
                      fontWeight: FontWeight.w500,fontSize: 16,),),
                      SizedBox(height: 25,),
                      Text("MY REFERRAL CODE",style: GoogleFonts.lato(color: Colors.white54,fontWeight: FontWeight.w400),),
                      SizedBox(height: 24,),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                            width: 2
                          ),
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white54
                        ),
                        child: Text("8FA8F5210FEB897&thid",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),

                      ),
                      SizedBox(height: 14,),
                      Text("TAP TO COPY",style: GoogleFonts.lato(color: Colors.lightBlue,fontWeight: FontWeight.w600,fontSize: 12),),
                      SizedBox(height: 40),
                      Container(

                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                         gradient: LinearGradient(
                           begin: Alignment.centerLeft,
                             end: Alignment.centerRight,
                             colors: [
                           Colors.lightGreen,
                           Colors.cyan,
                         ]

                         ),
                        ),
                       child:
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.share,color: Colors.white,),
                            SizedBox(width: 3,),
                            Text("REFER NOW",style: TextStyle(color: Colors.white),)
                          ],
                        ),

                      ),
                      SizedBox(height:24,),
                      Text("T&C*",style: GoogleFonts.lato(color: Colors.lightBlue,fontWeight: FontWeight.w600,fontSize: 12),),

                    ],
                  ),
                ),
          ))
        ],
      )),
    );
  }
}
