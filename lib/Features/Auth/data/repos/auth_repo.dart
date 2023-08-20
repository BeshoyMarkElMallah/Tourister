abstract class AuthRepo {
  Future<void> signInwithEmail(String email, String password);
  Future<void> signInWithGoogle();
  Future<void> signInWithFacebok();
  Future<void> signInWithApple();
}
