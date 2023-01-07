import 'package:crypto_land/CoinsHomePage/View/MyWallet.dart';
import 'package:crypto_land/LoginPage/LoginScreen.dart';
import 'package:crypto_land/Screens/MyCardPage.dart';
import 'package:crypto_land/Screens/ProfileItemWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String photoURL = "", email="", name="",id,availableBalance;
  bool isLoading=true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text("Profile "),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 20.0,
          ),
          child: Column(
            children: [
              Row(),
              SizedBox(
                height: 30,
              ),
              photoURL != null
                  ? ClipOval(
                      child: Material(
                        color: Colors.grey,
                        child: Image.network(
                          photoURL,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : ClipOval(
                      child: Material(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.person,
                            size: 75,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 16.0),
              SizedBox(height: 8.0),
              Text(
                name,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                '( $email )',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(height: 24.0),
              MyProfileWidget.items("Available Balance", isLoading==true?"Loading..":"$availableBalance\$"),
              InkWell(
                  onTap: ()=>Get.to(MyWalletPage.nav(id.toString())),
                  child: MyProfileWidget.items("My Wallet", "->")),
              InkWell(
                  onTap: (){
                    Get.snackbar("Statement sheet", "Will be sent to registered Email.",colorText: Colors.white,snackPosition: SnackPosition.BOTTOM);
                  },
                  child: MyProfileWidget.items("Statement sheet", "->")),
              InkWell(
                  onTap: ()=>Get.toNamed("/MyCardsPage", arguments: name.toString()),
                  child: MyProfileWidget.items("My Cards", "->")),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.redAccent,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: ()   {
                 _showDialog(context);


                },
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      name = preferences.getString("userName")!;
      email = preferences.getString("email")!;
      photoURL = preferences.getString("photo")!;
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
        availableBalance =   double.parse(dVlaue.toStringAsFixed(3)).toString();
        isLoading = false;
      });
    } else {
      print('No data available.');
    }
  }
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Crypto Land"),
          content: Text("Do you really want to Sign Out?"),
          actions:<Widget> [
            Row(
              children: [
                TextButton(onPressed: () async {
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  await preferences.clear();
                  Get.offAll(() => MyLoginScreen());
                }, child: Text("Yes")),
                TextButton(onPressed: (){
                  Navigator.of(context, rootNavigator: true).pop();
                }, child: Text("No"))
              ],
            )
          ],

        );
      },
    );
  }
}
