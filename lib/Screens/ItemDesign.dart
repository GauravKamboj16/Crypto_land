import 'package:crypto_land/CoinDetails/View/CoinDetailScreen.dart';
import 'package:crypto_land/Models/CryptoModel.dart';

import 'package:flutter/material.dart';
import 'package:sparkline/sparkline.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDesign extends StatelessWidget {
  CryptoModel ?cryptoModel;
  int ?Index;

  List<CryptoModel> list=[];

  ItemDesign.design(this.cryptoModel, this.Index);

  ItemDesign({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var item=cryptoModel!.data!.coins!.elementAt(Index!);

    List<String>? prices=item.sparkline;


    return GestureDetector(
      onTap: () {
        Get.to(DetailedCoinScreen(), arguments: Index);
        print("Item design $Index");
      },
      child: Container(
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
              backgroundImage: NetworkImage(item.iconUrl.toString())),
            ),
                // Image.network("https://th.bing.com/th/id/OIP.YBKxF3DlVPHLunAGuqRC5gHaFO?w=251&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",height: 35,width: 35,fit: BoxFit.fill,)),
            SizedBox(width: 10,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(item.symbol.toString(),style: GoogleFonts.lato(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                Text(item.name.toString(),style: GoogleFonts.lato(color: Colors.white54,fontWeight: FontWeight.w400,fontSize: 14),overflow: TextOverflow.ellipsis,softWrap: true,
                   textWidthBasis: TextWidthBasis.parent,
                ),
              ],),
            ),
            Spacer(),

            Expanded(
              flex: 2,

                child: Text(item.price.toString(),style: GoogleFonts.lato(color: Colors.orange,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
          SizedBox(width: 10,),
            // Sparkline(data: numbers)


          ],
        ),
      ),
    );
  }
}
