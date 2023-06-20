import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/views/widgets/drawer/drawer.dart';
import 'package:amide_app/views/widgets/reminder/tile.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  // reference the hive box

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: AppColors.primBlue,
          centerTitle: true,
          title: const Text(
            'Reminder',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Montserrat', color: Colors.white),
          )),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primBlue,
        foregroundColor: Colors.white,
        label: const Text('Add Reminder'),
        icon: const Icon(Icons.person_add_alt_1_rounded),
        onPressed: () => context.pushRoute(
          const CreateReminderRoute(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Reminder List',
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Montserrat', color: Colors.black),
              ),
              const SizedBox(height: 20),

              StreamBuilder(
                stream: DatabaseServices().reminders,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }

                  return snapshot.data!.isEmpty
                      ? const SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(height: 60),
                              Icon(
                                Icons.cancel_sharp,
                                size: 100,
                              ),
                              Text(
                                'No Reminders yet',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ReminderTile(
                                reminder: snapshot.data![index],
                              );
                            },
                          ),
                        );
                },
              ),

              // Expanded(
              //   child: Provider.of<ReminderData>(context).reminderCount == 0
              //       ? SizedBox(
              //           width: width,
              //           child: const Column(
              //             children: [
              //               SizedBox(height: 60),
              //               Icon(
              //                 Icons.cancel_sharp,
              //                 size: 100,
              //               ),
              //               Text(
              //                 'No Reminders, yet',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w700,
              //                     fontSize: 18,
              //                     fontFamily: 'Montserrat',
              //                     color: Colors.black),
              //               ),
              //             ],
              //           ),
              //         )
              //       : ListView.builder(
              //           itemCount: Provider.of<ReminderData>(context).reminderCount,
              //           itemBuilder: ((context, index) {
              //             return ReminderTile(
              //               tileIndex: index,
              //             );
              //           }),
              //         ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
