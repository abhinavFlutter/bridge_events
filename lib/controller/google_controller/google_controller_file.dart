import 'package:bridge_events/screen/homePage/navigation_page/navigation.dart';
import 'package:bridge_events/screen/splash_screen_page/splashScreen.dart';
import 'package:bridge_events/screen/trash/trash1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model/userModel.dart';
import '../device_controller_token/deviceTokenController.dart';


class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  Rx<User?> user = Rx<User?>(null);

  Future<void> signInWithGoogle() async {
    final GetDeviceTokenController getDeviceTokenController =
    Get.put(GetDeviceTokenController());
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
        await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName.toString(),
            email: user.email.toString(),
            phone: user.phoneNumber.toString(),
            userImg: user.photoURL.toString(),
            userDeviceToken: getDeviceTokenController.deviceToken.toString(),
            country: '',
            userAddress: '',
            street: '',
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
            city: '',
          );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
          Get.offAll(() => const NavigationScreen());
        }
      }
    } catch (e) {
      print("error $e");
    }
  }

  Future<void> signOutGoogle() async {
    try {
      await _googleSignIn.signOut();
      user(null); // Assuming that `user` is a function to update the user state

      print("User Signed Out");
      Get.offAll(() =>
      const Splashscreen1()); // Use Get.offAll to navigate to MainScreen
    } catch (e) {
      // Handle any errors that occurred during sign out
      print("Error signing out: $e");
    }
  }
}