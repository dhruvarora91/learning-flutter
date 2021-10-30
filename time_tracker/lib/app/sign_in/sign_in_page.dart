import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_button.dart';
import 'package:time_tracker/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  void _showSignInError({
    required BuildContext context,
    required Exception exception,
  }) {
    showExceptionAlertDialog(
      context,
      title: 'Sign In Failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(
        context: context,
        exception: e,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(
        context: context,
        exception: e,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Time Tracker',
        ),
        elevation: 2,
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    'Sign In',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
          SizedBox(height: 48),
          SocialSignInButton(
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            assetName: 'images/google-logo.png',
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(height: 8),
          // SocialSignInButton(
          //   color: Color(0xFF334D92),
          //   onPressed: () {},
          //   text: 'Sign in with Facebook',
          //   textColor: Colors.white,
          //   assetName: 'images/facebook-logo.png',
          // ),
          SizedBox(height: 8),
          SignInButton(
            color: Colors.teal,
            onPressed: () => _signInWithEmail(context),
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
            onPressed: () => _signInAnonymously(context),
            text: 'Sign in Anonymously',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
