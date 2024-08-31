import 'package:alumni_app/navigation_manu.dart';
import 'package:alumni_app/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  //Get authenticated user data
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    screenRedirect();
    super.onReady();
  }

  ///[Screen Redirect]
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(() => const SignInScreen());
    }
  }

  ///[User Registration] --
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Something went wrong. Try again';
    }
  }

  ///[User Login] --
  Future<UserCredential> loginWihEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'e';
    }
  }

  ///[LogoutUser] -- logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const SignInScreen());
    } catch (e) {
      throw 'e';
    }
  }
}
