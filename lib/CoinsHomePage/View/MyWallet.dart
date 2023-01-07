import 'package:crypto_land/Screens/ItemDesign.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWalletPage extends StatefulWidget {
  final String id;


  MyWalletPage.nav(this.id);

  MyWalletPage({Key? key, required this.id}) : super(key: key);

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
    bool _isDataNull=false;
    DatabaseReference dbRef=FirebaseDatabase.instance.ref("App Data").child("UserBoughtCoins");
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Hii my name is GAurav....");
    print(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text("My Wallet"),
        backgroundColor: Colors.deepPurple[900],
      ),

      body: SafeArea(
        child: Column(

            children:[
                Expanded(
                flex: 1,
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,

                      child: _isDataNull ==true?
                          Text("Empty Wallet"):
                          SizedBox(height: 1,)
                      ,

                    ),
                    FirebaseAnimatedList(

                        defaultChild: Center(child: CircularProgressIndicator()),

                        query:   dbRef.child(widget.id.toString()),
                        itemBuilder:  (BuildContext context, DataSnapshot snapshot,
                            Animation<double> animation, int index) {

                          print("Hi there the data is "+dbRef.path);
                          if(!snapshot.exists){
                            print("Null data Gaurav");

                            _isDataNull=true;
                            setState((){});
                            print(_isDataNull);
                            return  Container(
                              height: 100,
                              width: 100,
                              color: Colors.white,
                            );
                          }
                          else {
                            return
                              itemDesign(snapshot);
                          }
                        }

                    ),
                  ],

                ),
              ),

    ]),
      ),
    );
  }
 // Future<void> getData() async {
 //    SharedPreferences preferences = await SharedPreferences.getInstance();
 //
 //    mId = preferences.getString("id")!;
 //    // setState(() {
 //    //
 //    //       });
 //    // dbRef=await FirebaseDatabase.instance.ref("App Data").child("UserBoughtCoins").child(id);
 //    print(dbRef.path);
 //    setState((){});
 //
 //  }

Widget itemDesign(DataSnapshot snapshot){
  return GestureDetector(

        onTap: (){
          Get.toNamed("/sellCoinsPage",arguments: [
            {"name": snapshot.child("name").value.toString()},
            {"symbol": snapshot.child("symbol").value.toString()},
            {"price": snapshot.child("price").value.toString()},
            {"allCoins": snapshot.child("allCoins").value.toString()},

          ]);
        },
    child: snapshot.value==0?
    Container( height: 100,
      width: 100,
      color: Colors.white,):
    Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      width: MediaQuery.of(context).size.width,
      height: 76,
      decoration: BoxDecoration(
          color: Colors.deepPurple[900],
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 12,),
          Expanded(
            flex: 1,
            child: CircleAvatar(
                backgroundImage: NetworkImage(snapshot.child("iconUrl").value.toString())),
          ),
          // Image.network("https://th.bing.com/th/id/OIP.YBKxF3DlVPHLunAGuqRC5gHaFO?w=251&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",height: 35,width: 35,fit: BoxFit.fill,)),
          SizedBox(width: 10,),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.child("symbol").value.toString(),style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                Text(snapshot.child("name").value.toString(),style: GoogleFonts.lato(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 14),overflow: TextOverflow.ellipsis,softWrap: true,
                  textWidthBasis: TextWidthBasis.parent,
                ),
              ],),
          ),
          Spacer(),

          Expanded(
              flex: 2,

              child: Text(snapshot.child("allCoins").value.toString(),style: GoogleFonts.lato(color: Colors.orange,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
          SizedBox(width: 10,),
          // Sparkline(data: numbers)


        ],
      ),
    ),
  );
}

}
