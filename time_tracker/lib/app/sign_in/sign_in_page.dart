import 'package:flutter/material.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatelessWidget {
  final AuthBase auth;

  const SignInPage({
    Key? key,
    required this.auth,
  }) : super(key: key);

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Center(
            child: Text(
          'Time Tracker',
        )),
        elevation: 2,
      ),
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            assetName: 'images/google-logo.png',
            onPressed: _signInWithGoogle,
          ),
          SizedBox(height: 8),
          SocialSignInButton(
            color: Color(0xFF334D92),
            onPressed: () {},
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            assetName: 'images/facebook-logo.png',
          ),
          SizedBox(height: 8),
          SignInButton(
            color: Colors.teal,
            onPressed: () {},
            text: 'Sign in with Email',
            textColor: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          SignInButton(
            color: Colors.lime,
            onPressed: _signInAnonymously,
            text: 'Sign in Anonymously',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
