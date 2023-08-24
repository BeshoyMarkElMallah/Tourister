import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourister/Features/Auth/data/repos/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepoImpl) : super(AuthInitial());

  final AuthRepoImpl _authRepoImpl;

  void signInWithGoogle() async {
    emit(AuthLoading());
    String uid = await _authRepoImpl.signInWithGoogle();
    emit(AuthSignedInWithGoogle(uid: uid));
  }

  void signInWithFacebook() async {
    emit(AuthLoading());
    await _authRepoImpl.signInWithFacebok();
    emit(AuthSignedInWithFacebook(uid: null));
  }

  void signInWithApple() async {
    emit(AuthLoading());
    await _authRepoImpl.signInWithApple();
    emit(AuthSignedInWithApple(uid: null));
  }

  void signInwithEmail(String email, String password) async {
    emit(AuthLoading());
    var error = await _authRepoImpl.signInwithEmail(email, password);
    error.fold((l) {
      if (l == 'user-not-found') {
        emit(AuthError(error: 'user not found'));
      } else if (l == 'wrong-password') {
        emit(AuthError(error: 'wrong password'));
      } else if (l == "invalid-email") {
        emit(AuthError(error: 'please enter a valid email'));
      } else {
        emit(AuthError(error: 'something went wrong'));
      }
    }, (r) {
      _authRepoImpl.saveDataLocally(uid: r!);
      emit(AuthSignedInWithEmail(uid: r));
    });
  }

  Future<void> signUpWithEmail(
      {required String email, required String password}) async {
    emit(AuthLoading());
    var error = await _authRepoImpl.signUpwithEmail(email, password);
    if (error != null) {
      if (error == 'weak-password') {
        emit(AuthError(error: 'weak password'));
      } else if (error == 'email-already-in-use') {
        emit(AuthError(error: 'email already in use'));
      } else {
        emit(AuthError(error: 'something went wrong'));
      }
    } else {
      emit(AuthSignedUpWithEmail());
    }
  }
}
