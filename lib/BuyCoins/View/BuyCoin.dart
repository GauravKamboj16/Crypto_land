
import 'package:crypto_land/BuyCoins/Model/BuyCoinModel.dart';
import 'package:crypto_land/CoinsHomePage/View/Home_Coin_Screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class BuyCoinScreen extends StatefulWidget {
  const BuyCoinScreen({Key? key}) : super(key: key);

  @override
  State<BuyCoinScreen> createState() => _BuyCoinScreenState();
}

class _BuyCoinScreenState extends State<BuyCoinScreen> {
  bool isOrderPlaced = false;
  var name, symbol, price, iconUrl;
  var id, availableBalance;
  bool isLoading = true;
  bool isDataBeingWritten=false;
  late BuyCoinModel model;
  late DatabaseReference dbRef,dbRef2,database;
  double amountToBeAllocated = 0;
  late double b;
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    dynamic argumentData = Get.arguments;

    name = argumentData[0]['name'];
    symbol = argumentData[1]['symbol'];
    price = argumentData[2]['price'];

    iconUrl = argumentData[3]['iconUrl'];
    print("the price is $price" +
        "name is $name" +
        "symbol is $symbol" +
        " icon url is $iconUrl");
    dbRef = FirebaseDatabase.instance.ref("App Data").child("UserBoughtCoins");
    dbRef2=FirebaseDatabase.instance.ref("App Data").child("Account Balance");
    database=FirebaseDatabase.instance.ref("App Data").child("UserBoughtCoins");

    getData();
    super.initState();
    // getCreds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  symbol.toString(),
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
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
                    isLoading == true
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
                        : Text(
                            availableBalance,
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
                Text(
                  "Amount in USDT",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(

                    onChanged: (value) {
                      value == ""
                          ? b = 0.00
                          : b = double.parse(value) / double.parse(price);
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
                          color: Colors.white, fontWeight: FontWeight.w400),
                      suffixText: "USDT",
                      suffixStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                      filled: true,
                      fillColor: Colors.indigo[800],
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(10)),
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
                    Text("Total $symbol",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14)),

                    Container(child: isDataBeingWritten==true ?
                    CircularProgressIndicator():
                     Container()

                    )

                    ,
                    Text(
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
                    isDataBeingWritten=true;
                    setState((){});
                    // double amountCoins = double.parse(amountController.text);
                    // double coinPrice = double.parse(price);
                    //

                    isLoading == true
                        ? Get.snackbar("Please wait ", "Fetching your amount")
                        :
                        print( double.parse("10000") > double.parse(availableBalance.toString()));//




                        if(double.parse(amountController.text.toString()) > double.parse(availableBalance.toString())){

                          isDataBeingWritten=false;
                          setState((){});

                          Get.snackbar('Error!!!', "Add more money to buy coins!",snackStyle: SnackStyle.FLOATING,colorText: Colors.white,snackPosition: SnackPosition.TOP,icon: Icon(Icons.warning,color: Colors.red,),);


                        }else if(double.parse(amountController.text.toString())<0){
                          Get.snackbar('Error!!!', "Please Enter valid amount",snackStyle: SnackStyle.FLOATING,colorText: Colors.white,snackPosition: SnackPosition.TOP,icon: Icon(Icons.warning,color: Colors.red,),);
                          isDataBeingWritten=false;
                          setState((){});
                        }
                        else {


                          dbRef.child(id).child(symbol).once().then((value)  {

                            if(value.snapshot.exists){
                              double b = double.parse(amountController.text.toString()) / double.parse(price);
                              final String vl=value.snapshot.child("symbol").value.toString();
                              final String coinNum=value.snapshot.child("allCoins").value.toString();

                              var newAmount=double.parse(amountToBeAllocated.toString())+ double.parse(coinNum);


                              dbRef.child(id).child(symbol).child("allCoins").set(newAmount.toString())
                              .whenComplete(() {
                                dbRef2.child(id.toString())
                                    .set((double.parse(availableBalance) -
                                    double.parse(amountController.text.toString()))
                                    .toString());
                                isDataBeingWritten = false;
                                setState(() {});
                                Get.offAll(MyCoinsHomeScreen());
                                print("Allocated Successfully");


                              });




                            }else{
                              dbRef.child(id).child(symbol).set({
                                "name": name,
                                "symbol": symbol,
                                "price": price,
                                "iconUrl": iconUrl,
                                "allCoins": amountToBeAllocated
                              }).whenComplete(() {
                                dbRef2.child(id.toString())
                                    .set((double.parse(availableBalance) -
                                    double.parse(amountController.text.toString()))
                                    .toString());
                                isDataBeingWritten = false;
                                setState(() {});
                                Get.offAll(MyCoinsHomeScreen());
                                print("Allocated Successfully");
                              });



                            }

                          });


                          //
                          // dbRef.child(id).child(symbol).set({
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
                          colors: [Colors.lightGreen, Colors.green],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: Center(
                        child: isOrderPlaced == false
                            ? Text(
                                "Place Order",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            : Icon(
                                Icons.done,
                                color: Colors.white,
                              )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void getCreds() {
  //   dynamic argumentData = Get.arguments;
  //
  //   name=  argumentData[0]['name'];
  //   symbol= argumentData[1]['symbol'];
  //   price=argumentData[2]['price'];
  //   iconUrl=argumentData[3]['iconUrl'];
  //     }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      id = preferences.getString("id")!;
      print(id.toString());
      getTotalBalance();
    });
  }

  Future<void> getTotalBalance() async {
    final dbReff =
        FirebaseDatabase.instance.ref("App Data").child("Account Balance");
    final snapshot = await dbReff.child(id).get();
    if (snapshot.exists) {
      print(snapshot.value);
      print((snapshot.value).toString() + "gaurav Kamboj");

      setState(() {
        double dVlaue=double.parse(snapshot.value.toString());
        availableBalance =   double.parse(dVlaue.toStringAsFixed(3)).toString();
        isLoading = false;
      });
    } else {
      print('No data available.');
    }
  }

}
