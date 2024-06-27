import 'package:class_catch/features/auth/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final authViewModel = ref.read(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: user.when(
        data: (user) {
          if (user != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (user.photoUrl != null)
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoUrl!),
                      radius: 40,
                    ),
                  const SizedBox(height: 20),
                  Text('Logged in as ${user.displayName ?? user.email}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => authViewModel.signOut(),
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  authViewModel.signInWithGoogle();
                },
                child: const Text('Login with Google'),
              ),
            );
          }
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
