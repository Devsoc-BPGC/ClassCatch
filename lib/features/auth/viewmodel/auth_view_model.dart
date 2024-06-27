import 'package:class_catch/features/auth/model/user.dart';
import 'package:class_catch/features/auth/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider((ref) => AuthService());

final userProvider = StreamProvider<UserModel?>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.user;
});

class AuthViewModel {
  final AuthService _authService;

  AuthViewModel(this._authService);

  Future<void> signInWithGoogle() async {
    await _authService.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}

final authViewModelProvider = Provider((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthViewModel(authService);
});
