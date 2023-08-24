part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
}

final class AuthSuccess extends AuthState {}

final class AuthSignedOut extends AuthState {}

final class AuthSignedIn extends AuthState {
  final String? uid;

  AuthSignedIn({required this.uid});
}

final class AuthSignedInWithGoogle extends AuthState {
  final String? uid;

  AuthSignedInWithGoogle({required this.uid});
}

final class AuthSignedInWithFacebook extends AuthState {
  final String? uid;

  AuthSignedInWithFacebook({required this.uid});
}

final class AuthSignedInWithApple extends AuthState {
  final String? uid;

  AuthSignedInWithApple({required this.uid});
}

final class AuthSignedInWithEmail extends AuthState {
  final String? uid;

  AuthSignedInWithEmail({required this.uid});
}

final class AuthSignedUpWithEmail extends AuthState {}
