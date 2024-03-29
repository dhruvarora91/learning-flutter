import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker/common_widgets/form_submit_button.dart';
import 'package:time_tracker/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker/services/auth.dart';

class EmailSignInFormStateful extends StatefulWidget {
  @override
  State<EmailSignInFormStateful> createState() =>
      _EmailSignInFormStatefulState();
}

class _EmailSignInFormStatefulState extends State<EmailSignInFormStateful> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Sign in Failed',
        exception: e,
      );
    } finally {
      _isLoading = false;
    }
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  void _toggleFormType() {
    setState(() {
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    final primaryText =
        _formType == EmailSignInFormType.signIn ? 'Sign In' : 'Sign Up';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an Account? Register'
        : 'Have an Account? Sign In';

    return [
      _buidEmailTextField(),
      SizedBox(height: 8),
      _buildPasswordTextField(),
      SizedBox(height: 8),
      FormSubmitButton(
        onPressed: _submit,
        text: primaryText,
      ),
      SizedBox(height: 8),
      TextButton(
        onPressed: _toggleFormType,
        child: Text(
          secondaryText,
        ),
        style: ElevatedButton.styleFrom(),
      ),
    ];
  }

  TextField _buildPasswordTextField() {
    return TextField(
      controller: _passwordController,
      textInputAction: TextInputAction.done,
      obscureText: true,
      focusNode: _passwordFocusNode,
      onEditingComplete: _submit,
      decoration: InputDecoration(
        labelText: 'Password',
        enabled: _isLoading == false,
      ),
    );
  }

  TextField _buidEmailTextField() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      focusNode: _emailFocusNode,
      autocorrect: false,
      onEditingComplete: _emailEditingComplete,
      decoration: InputDecoration(
        labelText: 'Email',
        enabled: _isLoading == false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }
}
