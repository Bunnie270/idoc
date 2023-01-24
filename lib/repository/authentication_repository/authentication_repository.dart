import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:testklk/repository/exceptions/signup_email_and_password_failure.dart';
import 'package:testklk/src/components/hidden_drawer.dart';

import 'package:testklk/src/screens/HomePage.dart';
import 'package:testklk/src/screens/welcome/onboarding_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const HomePage());
  }

  //signup
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebaseUser.value != null
          ? Get.offAll(() => const HiddenDrawer())
          : Get.to(() => const WelcomeScreen());

      //add user details
      /* addUserDetails(
        _firstnameController.text.trim(),
        _lastnameContoller.text.trim(),
        _emailController.text.trim(),
        int.parse(_ageController.text.trim()),
        _addressController.text.trim(),
        _occupationController.text.trim(),
      );*/

    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

//login
  Future<void> logIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  //logout
  Future<void> logout() async => await _auth.signOut();
}
