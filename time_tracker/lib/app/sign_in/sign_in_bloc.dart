import 'dart:async';

import 'package:time_tracker/services/auth.dart';

class SignInBloc {
  SignInBloc({required this.auth});
  final AuthBase auth;

  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);

  Future signInAnonymously() async {
    try {
      _setIsLoading(true);
      await auth.signInAnonymously();
    } catch (e) {
      _setIsLoading(false);
      rethrow;
    }
  }

  Future signInWithGoogle() async {
    try {
      _setIsLoading(true);
      await auth.signInWithGoogle();
    } catch (e) {
      rethrow;
    } finally {
      _setIsLoading(false);
    }
  }
}
