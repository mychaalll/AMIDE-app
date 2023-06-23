import 'package:admin/views/screens/desktop/home.dart';
import 'package:admin/views/widgets/toast/custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginServices extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void toggleLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        Navigator.pushNamed(context, DesktopHomeScreen.route);
      });
    } catch (e) {
      CustomToast.showCustomMessage(
        context: context,
        message: "Incorrect username/password.",
      );
    }
    notifyListeners();
  }
}
