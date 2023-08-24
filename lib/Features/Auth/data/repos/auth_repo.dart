import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String?, String?>> signInwithEmail(
      String email, String password);
  Future<String?> signUpwithEmail(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebok();
  Future<void> signInWithApple();
  Future<void> saveDataLocally({required String uid});
}
