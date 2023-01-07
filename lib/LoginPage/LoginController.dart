import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController{

  RxString userMail="user".obs;
  bool valuefirst = false;
  bool valuesecond = false;
  RxBool isLoading=true.obs;



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

  userMail=googleUser!.displayName! as RxString;
  isLoading=false as RxBool;
  // Once signed in, return the UserCredential

  return await FirebaseAuth.instance.signInWithCredential(credential);
}



}

void showSnackBar(String title,String msg){
  Get.snackbar(title, msg);
}