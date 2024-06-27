import 'package:class_catch/features/auth/services/auth_service.dart';

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
