import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RealTimeScreen extends StatelessWidget {
  const RealTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController temperatureController = TextEditingController();

    final ref = FirebaseDatabase.instance.ref("heart_rate");

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text("Temperature"),
            TextField(
              controller: temperatureController,
              decoration: const InputDecoration(),
            ),
            ElevatedButton(
              onPressed: () {
                // print("hi");
              },
              child: const Text("Submit"),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  return Text(
                    "${snapshot.child("day_one")}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
            const Expanded(
              child: ListTile(
                title: Text("Hi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
