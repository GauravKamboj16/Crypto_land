import 'package:crypto_land/CoinsHomePage/View/Home_Coin_Screen.dart';
import 'package:crypto_land/LoginPage/LoginController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyLoginScreen extends StatefulWidget {

  const MyLoginScreen({Key? key}) : super(key: key);

  @override
  State<MyLoginScreen> createState() => _MyLoginScreenState();
}

class _MyLoginScreenState extends State<MyLoginScreen> {
  LoginController controller=LoginController();
    String userMail="";
  // bool valuefirst = false;
  // bool valuesecond = false;
   bool isLoading=true;
  bool isSigned=false;
  late DatabaseReference dbRef;

@override
  void initState() {
    // TODO: implement initState
    super.initState();Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    dbRef = FirebaseDatabase.instance.ref("App Data").child("Account Balance");


  }
   Future<void> esureInitialized() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

   }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
     body:
         SafeArea(
           child: SingleChildScrollView(
             child: Padding(padding: EdgeInsets.all(14),
               child:
               Column(children: [
                 // Text("Crypto Land",style: GoogleFonts.lato(color: Colors.indigo,fontWeight: FontWeight.w600,fontSize: 20),),
                 Container(
                     margin: EdgeInsets.all(12),
                     child:
                     Image.asset("assets/images/bg.png")
                 ),
                 Text("Crypto Land",style: GoogleFonts.lato(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w800),),
                 SizedBox(height: 14,),
                 Text("Learn - Trade - Earn",style: GoogleFonts.poppins(color: Colors.black54,fontSize: 14),)
                 ,SizedBox(height: 24,),
                 GestureDetector(
                   onTap: (){

                     signInWithGoogle();

                     setState((){});
                     controller.isLoading.value==true?
                     CircularProgressIndicator(value: 5,
                       backgroundColor: Colors.grey,)

                         :
                     {
                       Get.snackbar("Login successful", "welcome back "+controller.userMail.value.toString()),
                       Get.offAll(MyCoinsHomeScreen(),arguments: [

                       ])

                     };


                     // Get.snackbar("Signup with google","Somethng went wrong");



                   },
                   child: Container(
                     margin: EdgeInsets.all(14),
                     width: MediaQuery.of(context).size.width,
                     height: 45,
                     decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey,
                             offset:Offset(-1, 2),
                           )
                         ],
                         borderRadius: BorderRadius.circular(26),
                         // color: Colors.deepPurple[800],
                         gradient: LinearGradient(colors: [Colors.indigo,(Colors.cyanAccent)],
                             end: Alignment.topRight,
                             begin: Alignment.topCenter)

                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         SizedBox(width: 18,),
                         Image.asset("assets/images/logo1.png",
                           height: 38,width: 38,),
                         SizedBox(width: 18,),
                         Text("Continue with google",style: GoogleFonts.poppins(fontSize :16,color: Colors.white,fontWeight: FontWeight.w600),),
                         Spacer()
                       ],
                     ),

                   ),
                 ),
                 SizedBox(height: 22,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       height: 2,
                       width: MediaQuery.of(context).size.width/3,
                       color: Colors.black45,
                     ),
                     SizedBox(width: 8,),
                     Text("Or",style: GoogleFonts.lato(color: Colors.black45),),
                     SizedBox(width: 8,),
                     Container(
                       height: 2,
                       width: MediaQuery.of(context).size.width/3,
                       color: Colors.black45,
                     ),

                   ],
                 ),
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     InkWell(
                       onTap: ()=>Get.snackbar("Signup with facebook","Somethng went wrong"),
                       child: Container(

                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.grey,
                                   offset:Offset(-0.3, 0.5),
                                 )
                               ]
                           ),
                           child: Image.asset("assets/images/facebook.png",fit: BoxFit.fill,)
                         // Image.network("https://th.bing.com/th/id/OIP.uQlQc1ej3xTRMpywzGuFvAHaHw?w=196&h=205&c=7&r=0&o=5&dpr=1.3&pid=1.7",fit: BoxFit.cover),
                       ),
                     ),
                     SizedBox(width: 20,),
                     InkWell(
                       onTap: ()=>Get.snackbar("Signup with twitter","Somethng went wrong"),
                       child: Container(

                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.grey,
                                   offset:Offset(-0.3, 0.5),
                                 )
                               ]
                           ),
                           child: Image.asset("assets/images/twitter.png")
                         // Image.network("https://th.bing.com/th/id/OIP.1x5qs5pV6hF3ePLEYp94XgHaHa?w=204&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7",fit: BoxFit.cover),
                       ),
                     ),SizedBox(width: 20,),
                     InkWell(
                       onTap: ()=>Get.snackbar("Signup with Linkedin","Somethng went wrong"),
                       child: Container(

                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             boxShadow: [
                               BoxShadow(
                                 color: Colors.grey,
                                 offset:Offset(-0.3, 0.5),
                               )
                             ]
                             //
                             // image: DecorationImage(
                             //     image: NetworkImage("https://th.bing.com/th/id/OIP.nP6ZHLpsBw9d7T8SNjV1igHaEn?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"))
                             //

                           ),
                           child: Image.asset("assets/images/linkedin.png")
                         // Image.network("https://th.bing.com/th/id/OIP.nP6ZHLpsBw9d7T8SNjV1igHaEn?w=257&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",fit: BoxFit.cover,),
                       ),
                     )
                   ],
                 ),

                 // Text(
                 //     isSigned==true?
                 //     "Hi you are signed in with account of $userMail":
                 //     "Please Sign in to continue"
                 // ),
                 //
                 // ElevatedButton(onPressed: (){
                 //
                 //   FirebaseAuth.instance.signOut();
                 //   setState((){
                 //     isSigned=false;
                 //   });
                 //
                 // }, child: Text("Sign out"))
                 //


               ],
               ),
             ),
           ),
         ),


    );
  }

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();


  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  setState((){

    userMail=googleUser!.displayName!;
    isLoading=false;
    isSigned=true;
    setCreds(googleUser.displayName, googleUser.email, googleUser.photoUrl, googleUser.id);
    // dbRef
    //     .child(googleUser.id.toString())
    //     .set("0.00");

    Get.off(MyCoinsHomeScreen());
  });




  return await FirebaseAuth.instance.signInWithCredential(credential);
}

  Future<void> setCreds(name,email,photo,id) async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("userName", name);
    preferences.setString("email", email);
    preferences.setString("id", id);
    preferences.setString("photo", photo);




  }



}