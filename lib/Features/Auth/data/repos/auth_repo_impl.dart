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
  Future<Either<String?, String?>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Sign in to Firebase with the Google [UserCredential].
      final UserCredential googleUserCredential =
          await FirebaseAuth.instance.signInWithCredential(googleCredential);

      print("doneeeeeeeeeee");
      FirebaseFirestore.instance
          .collection('users')
          .doc(googleUser?.id.toString())
          .set({});

      print("iddddd ${googleUser?.id}");

      print("nameee ${googleUser?.displayName}");
      return right(googleUser!.id.toString());
    } on FirebaseAuthException catch (e) {
      // print(e.message);
      return left(e.message!);
    }
  }

  @override
  Future<Either<String?, String?>> signInwithEmail(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

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
          FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user?.uid)
              .set({});
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
    prefs.setString('uid', uid);
  }

  @override
  Future<void> signOutGoogle() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }
}
