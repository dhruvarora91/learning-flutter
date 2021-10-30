import 'package:flutter/cupertino.dart';
import 'package:time_tracker/services/auth.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({required this.auth, required this.child}) : super(child: child);
  final AuthBase auth;
  final Widget child;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  // final auth = AuthProvider.of(context)
  static AuthBase of(BuildContext context) {
    AuthProvider? provider =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    return provider!.auth;
  }
}
