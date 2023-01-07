import 'package:crypto_land/CoinsHomePage/View/Home_Coin_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class SellCoinScreen extends StatefulWidget {
  const SellCoinScreen({Key? key}) : super(key: key);

  @override
  State<SellCoinScreen> createState() => _SellCoinScreenState();
}

class _SellCoinScreenState extends State<SellCoinScreen> {
  TextEditingController amountController=TextEditingController();
  var id,availableUSD,amountToBeAllocated,b;
  late String _symbol,name,price;
  bool isBalanceBeingFetched=true;
  late DatabaseReference dbRef,dbRef2;
  var totalCoins="0.06";
  bool isLoaing=false;


  @override
  void initState() {
    dynamic argumentData = Get.arguments;

    name = argumentData[0]['name'];
    _symbol = argumentData[1]['symbol'];
    price = argumentData[2]['price'];

    totalCoins = argumentData[3]['allCoins'];

    super.initState();
    dbRef = FirebaseDatabase.instance.ref("App Data").child("UserBoughtCoins");
    dbRef2=FirebaseDatabase.instance.ref("App Data").child("Account Balance");
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title:Text("Selling $_symbol"),
        backgroundColor:Colors.deepPurple[900]
      ),
      body:SafeArea(

        child: Padding(
          padding: EdgeInsets.all(14),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
              //     Text("Selling $name", style: GoogleFonts.lato(
              //     color: Colors.white,
              //     fontWeight: FontWeight.w800,
              //     fontSize: 20),
              // ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Available \$",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                      isBalanceBeingFetched == true
                          ? Shimmer.fromColors(
                        baseColor: Colors.indigo,
                        highlightColor: Colors.grey,
                        child: Text(
                          "Loading..",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      )
                         :
                Text(
                        availableUSD.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Available $_symbol",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                      // isLoading == true
                      //     ? Shimmer.fromColors(
                      //   baseColor: Colors.indigo,
                      //   highlightColor: Colors.grey,
                      //   child: Text(
                      //     "Loading..",
                      //     style: GoogleFonts.poppins(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 14),
                      //   ),
                      // )
                      // :
                      Text(
                        totalCoins.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  ), SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Amount in BTC",
                    style: GoogleFonts.poppins(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.indigo,
                          width: 1
                        ),
                        color: Colors.indigo[800]
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextFormField(

                                onChanged: (value) {
                                  value == ""
                                      ? b = 0.00
                                      : b = double.parse(value)*double.parse(price.toString());
                                  amountToBeAllocated = double.parse(b.toStringAsFixed(3));
                                  setState(() {});
                                },
                                controller: amountController,
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Total amount in USDT",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontWeight: FontWeight.w400),

                                  filled: true,
                                  fillColor: Colors.indigo[800],
                                  enabledBorder: InputBorder.none,
                                  focusedBorder:InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white70 ,
                            width: 3,
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: (){
                                amountController.text=totalCoins.toString();
                                double db = double.parse(amountController.text.toString())*double.parse(price.toString());
                                amountToBeAllocated = double.parse(db.toStringAsFixed(3));
                              setState((){});
                                // amountController.text=
                              },

                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: Text("MAX",style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.w800),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    width: 200,
                    color: Colors.indigo,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fee",
                          style: GoogleFonts.poppins(
                              color: Colors.white54,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),
                      Text(
                        "0.00",
                        style: GoogleFonts.poppins(
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total USD",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14)),

                      Container(child: isLoaing==true ?
                      CircularProgressIndicator():
                      Container()

                      )

                      ,
                      Text(
                        amountToBeAllocated ==null?
                        "0.00":
                        amountToBeAllocated.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {

                      isBalanceBeingFetched == true
                          ? Get.snackbar("Please wait ", "Fetching your amount")
                          :
                      print( double.parse("10000") > double.parse(availableUSD.toString()));//

                      if(double.parse(amountController.text.toString()) > double.parse(totalCoins.toString())){
                        //
                        // isDataBeingWritten=false;
                        // setState((){});

                        Get.snackbar('Error!!!', "you have Maximum $totalCoins BTC available",snackStyle: SnackStyle.FLOATING,colorText: Colors.white,snackPosition: SnackPosition.TOP,icon: Icon(Icons.warning,color: Colors.red,),);


                      }else if(double.parse(amountController.text.toString())<0  ){
                        Get.snackbar('Error!!!', "Enter valid amount",snackStyle: SnackStyle.FLOATING,colorText: Colors.white,snackPosition: SnackPosition.TOP,icon: Icon(Icons.warning,color: Colors.red,),);


                      }


                      else{   isLoaing=true;
                        setState((){});


                      double lCoins =double.parse(totalCoins)-double.parse(amountController.text.toString());
                      double leftCoins = double.parse(lCoins.toStringAsFixed(3));
                        dbRef.child(id).child(_symbol).child("allCoins").set(leftCoins.toString()).whenComplete(() {
                          double newUsdAmount=double.parse(amountToBeAllocated.toString())+double.parse(availableUSD.toString());
                          dbRef2.child(id).set(newUsdAmount.toString()).whenComplete(() {
                            
                            if(leftCoins<=0){
                              var ref = dbRef.child(id).child(_symbol);
                              ref.remove();
                            }
                            isLoaing=false;

                            Get.offAll(MyCoinsHomeScreen());
                          });
                        });




                        // dbRef.child(id).push().set({
                        //   "name": name,
                        //   "symbol": symbol,
                        //   "price": price,
                        //   "iconUrl": iconUrl,
                        //   "allCoins": amountToBeAllocated
                        // }).whenComplete(() {
                        //   dbRef2.child(id.toString())
                        //       .set((double.parse(availableBalance) -
                        //       double.parse(amountController.text.toString()))
                        //       .toString());
                        //   isDataBeingWritten = false;
                        //   setState(() {});
                        //   Get.offAll(MyCoinsHomeScreen());
                        //   print("Allocated Successfully");
                        // });
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: 55,
                      curve: Curves.fastOutSlowIn,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Center(
                          child:   Text(
                            "Sell",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                             ),
                    ),
                  )


                ],

              ),
            ),
          ),
        ),

      ),
    );
  }
  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      id = preferences.getString("id")!;
      print(id.toString());
      getTotalUSDBalance();
    });
  }
  Future<void> getTotalUSDBalance() async {
    final dbReff =
    FirebaseDatabase.instance.ref("App Data").child("Account Balance");
    final snapshot = await dbReff.child(id).get();
    if (snapshot.exists) {
      print(snapshot.value);
      print((snapshot.value).toString() + "gaurav Kamboj");

      setState(() {
        double dVlaue=double.parse(snapshot.value.toString());
        availableUSD=   double.parse(dVlaue.toStringAsFixed(3)).toString();
        isBalanceBeingFetched = false ;
      });
    } else {
      print('No data available.');
    }
  }
  // void insert(String content) {
  //   var text = amountController.text;
  //   var pos = amountController.selection.start;
  //   amountController.value = TextEditingValue(
  //     text: text.substring(0, pos) + content + text.substring(pos),
  //     selection: TextSelection.collapsed(offset: pos + content.length),
  //   );
  // }
}
