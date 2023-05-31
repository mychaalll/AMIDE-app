import 'package:amide_app/features/data/services/database.dart';
import 'package:flutter/material.dart';

class VitalSignScreen extends StatelessWidget {
  const VitalSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = DatabaseServices().vital;

    return Scaffold(
      body: StreamBuilder(
          stream: data,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${snapshot.data?[0].temperature}"),
              ],
            );
          }),
    );
  }
}
