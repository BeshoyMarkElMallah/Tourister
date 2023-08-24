import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourister/Features/Auth/data/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<void> signInWithApple() async {}

  @override
  Future<void> signInWithFacebok() async {}

  @override
  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            FirebaseFirestore.instance
                .collection('users')
                .doc(userCredential.user?.uid);
          }
          return userCredential.user!.uid;
        }
      }
      return '';
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      return e.message!;
    }
  }

  @override
  Future<Either<String?, String?>> signInwithEmail(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user?.uid);
        }
      }
      return right(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  @override
  Future<String?> signUpwithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user?.uid);
        }
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }

  @override
  Future<void> saveDataLocally({required String uid}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', FirebaseAuth.instance.currentUser!.uid);
  }
}
