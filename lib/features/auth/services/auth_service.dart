import 'package:class_catch/features/auth/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: user.email!,
          displayName: user.displayName,
          photoUrl: user.photoURL,
        );
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: user.email!,
          displayName: user.displayName,
          photoUrl: user.photoURL,
        );
      }
      return null;
    });
  }
}
