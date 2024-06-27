import 'package:class_catch/features/auth/model/user.dart';
import 'package:class_catch/features/auth/viewmodel/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth/services/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());

final userProvider = StreamProvider<UserModel?>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.user;
});

final authViewModelProvider = Provider((ref) {
  final authService = ref.read(authServiceProvider);
  return AuthViewModel(authService);
});
