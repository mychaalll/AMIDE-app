import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/strings/images.dart';
import 'package:admin/core/theme/color.dart';
import 'package:admin/services/login.dart';
import 'package:admin/views/screens/desktop/home.dart';
import 'package:admin/views/widgets/fields/custom.dart';
import 'package:admin/views/widgets/fields/password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopLoginScreen extends StatelessWidget {
  static String route = "/";
  DesktopLoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final LoginServices login = Provider.of<LoginServices>(context);

    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: login.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimen.defaultPadding),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(Dimen.defaultPadding),
                            child: Column(
                              children: [
                                SizedBox(height: Dimen.defaultPadding),
                                const Text(
                                  "Welcome back, Admin",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: Dimen.defaultPadding),
                                const Text(
                                  "Let us look all of our elderly",
                                  style: TextStyle(),
                                ),
                                const SizedBox(height: 100),
                                CustomTextField(
                                  controller: login.emailController,
                                  hintText: "Email address",
                                ),
                                SizedBox(height: Dimen.defaultPadding),
                                CustomPasswordField(
                                  controller: login.passwordController,
                                  hintText: "Password",
                                ),
                                const SizedBox(height: 50),
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        login.toggleLoading(true);
                                        await login.signIn(context);
                                      }
                                      login.toggleLoading(false);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColor.primBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(Dimen.defaultPadding * 0.3),
                                      ),
                                    ),
                                    child: const Text("Login"),
                                  ),
                                ),
                                SizedBox(height: Dimen.defaultPadding),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(Dimen.defaultPadding),
                            height: MediaQuery.of(context).size.height * 0.7,
                            decoration: BoxDecoration(
                              color: CustomColor.primBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Dimen.defaultPadding),
                                bottomLeft: Radius.circular(Dimen.defaultPadding),
                              ),
                            ),
                            child: Image.asset(IconAsset.logo),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
