import 'dart:convert';

import 'package:crypto_land/Models/CryptoModel.dart';
import 'package:crypto_land/Screens/ItemDesign.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

class MyCoinsScreen extends StatefulWidget {
  const MyCoinsScreen({Key? key}) : super(key: key);

  @override
  State<MyCoinsScreen> createState() => _MyCoinsScreenState();
}

class _MyCoinsScreenState extends State<MyCoinsScreen> {
  var data;
  bool isLoading=true;
  CryptoModel cryptoModel = CryptoModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoins();
  }

  Future<void> getCoins() async {
    Uri uri = Uri.parse("https://coinranking1.p.rapidapi.com/coins");
    Response response = await get(uri, headers: {
      'X-RapidAPI-Key': '9054473f12msh8875d641d62ad6ap1e1960jsn2879302db718',
      'X-RapidAPI-Host': 'coinranking1.p.rapidapi.com'
    });
    print(response.statusCode);
    String responsebody = response.body;
    data = json.decode(responsebody);
    //print(data);

    CryptoModel model = CryptoModel.fromJson(data);
    setState(() {
      cryptoModel = model;
      isLoading=false;
      print(cryptoModel.data!.coins!.first.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    var item = cryptoModel.data!.coins!;
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
        body: isLoading==true
            ? Center(child: CircularProgressIndicator())
            :

            Column(
              children: [
                SizedBox(height: 30,),
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
                                Text("Portfolio",style: GoogleFonts.poppins(color: Colors.white),),
                                Text("\$124535.42",style: GoogleFonts.poppins(color: Colors.white,fontSize: 23),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.notifications_outlined,color: Colors.white,size: 20,),
                    SizedBox(width: 25,),
                    Container(
                      decoration: BoxDecoration(
                      color:Colors.cyanAccent,
                          borderRadius: BorderRadius.circular(12)),
                      height: 35,width: 35,child: Icon(Icons.menu,color: Colors.white,),)
                  ,SizedBox(width: 25,),
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height/1.2,
                    child: ListView.builder(
                        itemCount: cryptoModel.data!.coins!.length,
                        itemBuilder: (context,index){
                      return ItemDesign.design(cryptoModel, index);
                    }),
                  ),
                )
              ],
            )
            // Center(child: CircularProgressIndicator())
            // Container(
            //   height: 150,
            //   child: Column(children: [
            //       Stack(
            //         children: [
            //
            //           Align(
            //             alignment: Alignment.topRight,
            //             child:Padding(padding: EdgeInsets.all(16),
            //             child:
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.end,
            //               children: [
            //                 Text("24HR ",style: GoogleFonts.lato(color: Colors.white),),
            //                 Text(" +4.34%",style: GoogleFonts.lato(color: Colors.green[600]),),
            //                 Icon(Icons.arrow_drop_up,color: Colors.green,)
            //               ],
            //             ),
            //           )
            //           )
            //
            //         ],
            //       ),
            //       ListView.builder(
            //           itemBuilder: (BuildContext context, int index) {
            //         return Card();
            //       }),
            //     ]),
            // )
    );
  }
}
