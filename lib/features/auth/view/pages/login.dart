import 'package:class_catch/features/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final authViewModel = ref.read(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
                  SizedBox(height: 20),
                  Text('Logged in as ${user.displayName ?? user.email}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => authViewModel.signOut(),
                    child: Text('Sign Out'),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: ElevatedButton(
                onPressed: () async {
                  final error = await authViewModel.signInWithGoogle();
                  if (error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error)),
                    );
                  }
                },
                child: Text('Login with Google'),
              ),
            );
          }
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
