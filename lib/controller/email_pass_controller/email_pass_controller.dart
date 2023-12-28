import 'package:bridge_events/screen/homePage/navigation_page/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../model/user_model/userModel.dart';
import '../device_controller_token/deviceTokenController.dart';


class EmailPassController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool passwordVisible = true.obs;
  RxBool loading = false.obs;
  void updateLoading(){
    loading.toggle();
  }
  void updateVisibility() {
    passwordVisible.toggle(); // Use toggle method to toggle the value
  }

  FirebaseAuth get auth => _auth;

  Future<void> signupUser(String email, String password, String name) async {
    final GetDeviceTokenController getDeviceTokenController =
    Get.put(GetDeviceTokenController());
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCredential.user!.updateDisplayName(name);
      await userCredential.user!.updateEmail(email);
      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: userCredential.user!.displayName ?? name,
        email: userCredential.user!.email ?? '',
        phone: userCredential.user!.phoneNumber ?? '',
        userImg: userCredential.user!.photoURL ??
            'https://firebasestorage.googleapis.com/v0/b/bridge-events-abe67.appspot.com/o/front-view-angry-model.jpg?alt=media&token=b08fcac9-0912-4ff5-bb7c-3464fb2d7c8f',
        userDeviceToken: getDeviceTokenController.deviceToken.toString(),
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: '',
      );
      try {
        await FirebaseFirestore.instance // Save user data to Firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      } catch (error) {
        print('Error saving user data to Firestore: $error');
        Get.snackbar(
          "Error",
          "$error",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      Get.snackbar('Success', 'Registration Successful');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'Password Provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'Email Provided already Exists');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  User? get currentUser => _auth.currentUser;
  Future<UserCredential?> signinUser(
      String userEmail, String userPassword) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user Found with this Email');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Password did not match');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> forgotPassword(
      String userEmail,
      ) async {
    try {
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Request Sent Sucessfully",
        "Password reset link sent to $userEmail",
        snackPosition: SnackPosition.TOP,
      );
      Get.off(const NavigationScreen(),
          transition: Transition.leftToRightWithFade);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}