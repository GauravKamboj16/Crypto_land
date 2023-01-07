import 'package:crypto_land/CoinsHomePage/View/Home_Coin_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

class MoneyDepositPage extends StatefulWidget {
  const MoneyDepositPage({Key? key}) : super(key: key);

  @override
  State<MoneyDepositPage> createState() => _MoneyDepositPageState();
}

class _MoneyDepositPageState extends State<MoneyDepositPage> {
  var name, photoUrl, mail, id;
  final _formKey = GlobalKey<FormState>();
  late DatabaseReference dbRef;
  bool isLoading = false;
  var availableBalance, newTotalBalance;
  bool balanceLoading = true;
  TextEditingController controller1 = TextEditingController();

  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    super.initState();

    getData();
    getTotalBalance();

    dbRef = FirebaseDatabase.instance.ref("App Data").child("Account Balance");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: RefreshIndicator(
        onRefresh: () => getTotalBalance()

        //HERE YOUR FUNCTION TO CALL
        ,
        child: Stack(
          children: <Widget>[
            ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
              SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              id != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        photoUrl,
                                        height: 45,
                                        width: 45,
                                      ),
                                    )
                                  : Icon(
                                      Icons.person,
                                      size: 40,
                                      color: Colors.grey,
                                    ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                name != null ? name : "...",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Your Balance",
                                  style: GoogleFonts.lato(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18)),
                              Row(
                                children: [
                                  balanceLoading == true
                                      ? Shimmer.fromColors(
                                          child: Text("Loading...",
                                              style: GoogleFonts.lato(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 32)),
                                          baseColor: Colors.indigo,
                                          highlightColor: Colors.white)
                                      : Text("$availableBalance",
                                          style: GoogleFonts.lato(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 32)),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text("\$",
                                      style: GoogleFonts.lato(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Deposit",
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 27)),
                          SizedBox(
                            height: 23,
                          ),
                          Text("Enter Amount",
                              style: GoogleFonts.lato(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller1,
                            validator: (value) {
                              if (value!.isEmpty ) {
                                return "*Field required";
                              }else if( double.parse(value)<0){
                                return "*Enter Valid Amount ";
                              }

                              else
                                return null;
                            },
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              suffixText: "\$",
                              contentPadding: EdgeInsets.all(12),
                              fillColor: Colors.indigo[300],
                              filled: true,
                              hintText: '0.00 ',
                              hintStyle: GoogleFonts.hind(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Card number",
                              style: GoogleFonts.lato(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13)),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.indigo[300],
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.black)),
                            child: Text(
                              "**** **** **** 3010",
                              style: GoogleFonts.hind(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "Note:These are fake card details and fake money intented for practice means only!",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          isLoading == true
                              ? Center(child: CircularProgressIndicator())
                              : SizedBox(height: 25),
                          SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });

                                double avMoney =
                                    double.parse(availableBalance.toString());
                                double newAmount =
                                    double.parse(controller1.text);

                                newTotalBalance = avMoney + newAmount;
                                dbRef
                                    .child(id.toString())
                                    .set(newTotalBalance.toString())
                                    .whenComplete(() {
                                      Get.offAll(MyCoinsHomeScreen());
                                  Get.snackbar(
                                      "Money Desposited Sucessfully $mail",
                                      "Enjoy trading",
                                      snackPosition: SnackPosition.BOTTOM);
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              } else {
                                return null;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: Colors.black)),
                              child: Text(
                                "Deposit",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.hind(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),

      //   RefreshIndicator(
      //     onRefresh: () =>getTotalBalance(),
      //     child: Stack(
      //       children: <Widget>[ListView(),
      //
      //    ],
      // ),
      // ),
    );
  }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      name = preferences.getString("userName")!;
      photoUrl = preferences.getString("photo")!;
      mail = preferences.getString("email")!;
      id = preferences.getString("id")!;
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
        availableBalance =   double.parse(dVlaue.toStringAsFixed(2));
        balanceLoading = false;
      });
    } else {
      print('No data available.');
    }
  }
}
