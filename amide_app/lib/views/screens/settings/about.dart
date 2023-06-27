import 'package:amide_app/core/config/image.dart';
import 'package:amide_app/views/widgets/tile/about.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutSettings extends StatelessWidget {
  const AboutSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Our Team",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  "Our team composed of students of Computer Engineering from Polytechnic University of the Philippines.",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                AboutCard(
                  name: "Lester Ecaldre",
                  subtitle: "Bachelor of Science in Computer Engineering",
                  image: IconAsset.lester,
                ),
                const SizedBox(height: 24.0),
                AboutCard(
                  name: "Edilberto Jr. S. Pajunar",
                  subtitle: "Bachelor of Science in Computer Engineering",
                  image: IconAsset.choi,
                ),
                const SizedBox(height: 24.0),
                AboutCard(
                  name: "Mychal Esurena",
                  subtitle: "Bachelor of Science in Computer Engineering",
                  image: IconAsset.mychal,
                ),
                const SizedBox(height: 24.0),
                AboutCard(
                  name: "Guiaochino TIamzon",
                  subtitle: "Bachelor of Science in Computer Engineering",
                  image: IconAsset.chino,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
