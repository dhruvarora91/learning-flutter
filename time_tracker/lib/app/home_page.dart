import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth_provider.dart';

class HomePage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          TextButton(
            onPressed: () => _signOut(context),
            child: Icon(
              Icons.logout,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
