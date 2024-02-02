import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = (await _googleSignIn.signIn())!;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      return authResult.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                User? user = await _handleSignIn();
                if (user != null) {
                  print('Successfully signed in with Google: ${user.displayName}');
                } else {
                  print('Failed to sign in with Google.');
                }
              },
              child: Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
