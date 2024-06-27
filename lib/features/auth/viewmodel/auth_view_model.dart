import 'package:class_catch/features/auth/services/auth_service.dart';

class AuthViewModel {
  final AuthService _authService;

  AuthViewModel(this._authService);

  Future<String?> signInWithGoogle() async {
    try {
      await _authService.signInWithGoogle();
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
