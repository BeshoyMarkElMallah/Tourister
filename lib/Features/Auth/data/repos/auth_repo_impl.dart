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
      if (googleUser == null) {
        return left('Please sign in with Google');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(googleCredential);

      print("doneeeeeeeeeee");

      final user = userCredential.user;
      if (user == null) {
        return left('No User');
      }

      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': user.displayName,
        // You can add other user information here
      });

      print("iddddd ${user.uid}");
      print("nameee ${user.displayName}");

      return right(user.uid); // Returning user UID
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.code} - ${e.message}");
      return left(
          e.message); // Re-throw the exception to handle it at a higher level
    } catch (e) {
      print("Error: $e");
      return left(e.toString()); // Custom error message
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
