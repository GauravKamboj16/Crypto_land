import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> settingList=["Push Notifications","Withdrawal Settings","Currency","Clear Cache","Network Test",
    "Terms of Use","Privacy Policy","About Us"];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple[800],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[900],
          title: Text("Settings",style: TextStyle(color: Colors.white),),
        ),
        body: ListView.builder(
            itemCount: settingList.length,
            itemBuilder: (context,index){
          return Card(
            color: Colors.deepPurple[800],
            margin: EdgeInsets.all(4),
            child: ListTile(

              title: Text(settingList.elementAt(index).toString(),style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600),),
              trailing: Icon(Icons.arrow_right,color: Colors.white),
            ),
          );

        }),
      ),
    );
  }
}
