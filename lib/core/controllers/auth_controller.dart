import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tasks/core/services/user_service.dart';
import 'package:tasks/helper/cache_helper.dart';
import 'package:tasks/helper/constance.dart';
import 'package:tasks/models/user_model.dart';
import 'package:tasks/views/root_view.dart';
import 'package:tasks/views/splash_view.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rxn<User> _user = Rxn<User>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState>? regFormKey = GlobalKey<FormState>();
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString name = ''.obs;
  User? get user => _user.value;
  @override
  Future<void> onInit() async {
    _user.bindStream(_auth.authStateChanges());
    print(await CacheHelper.getData('user'));

    super.onInit();
  }

  login() async {
    loginFormKey.currentState!.save();
    await _auth
        .signInWithEmailAndPassword(
      email: email.value,
      password: password.value,
    )
        .then(
      (value) {
        saveUser(value);
      },
    ).catchError(
      (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            "Login faield",
            'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            "Login faield",
            'Wrong password provided for that user.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }

  register() async {
    regFormKey!.currentState!.save();
    await _auth
        .createUserWithEmailAndPassword(
      email: email.value,
      password: password.value,
    )
        .then(
      (value) {
        saveUser(value);
      },
    ).catchError(
      (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
            "Login faield",
            'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            "Login faield",
            'Wrong password provided for that user.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      },
    );
  }

  signOut() async {
    await _auth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    Get.offAll(() => SplashView());
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then(
      (value) {
        saveUser(value);
      },
    );
  }

  saveUser(UserCredential user) {
    UserService().addUserToFirestore(
      UserModel(
        displayName: user.user!.displayName ?? name.value,
        email: user.user!.email,
        uid: user.user!.uid,
        photoURL: user.user!.photoURL ?? personPlaceholderImage,
      ),
    );
    Get.offAll(RootView());
  }
}
