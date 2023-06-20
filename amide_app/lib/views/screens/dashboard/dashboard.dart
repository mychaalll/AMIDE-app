import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:amide_app/features/data/models/reminder/reminder.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/views/widgets/buttons/custom.dart';
import 'package:amide_app/views/widgets/dashboard/elderly_tile.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widgets/dashboard/main_button.dart';
import '../../widgets/dashboard/topbar.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DatabaseServices().elders;
      DatabaseServices().reminders;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReminderData>(builder: (context, value, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.bgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 11),
                    //hello user, settings icon
                    const Topbar(name: "Guardian"),
                    const SizedBox(height: 20),
                    //date
                    Center(
                      child: Text(
                        DateFormat('E, d MMM yyyy').format(DateTime.now()).toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 27),
                    //buttons
                    SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          MainButton(
                            icon: Icons.view_list_rounded,
                            title: 'Reminders',
                            navigation: () {
                              context.pushRoute(
                                const ReminderRoute(),
                              );
                            },
                          ),
                          const SizedBox(width: 13),
                          MainButton(
                            icon: Icons.elderly_sharp,
                            title: 'Elderly',
                            navigation: () {
                              context.router.push(
                                const ElderlyRoute(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //incoming reminders
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Incoming Reminders',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 22),
                        StreamBuilder<List<Reminder>>(
                          stream: DatabaseServices().reminders,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.connectionState == ConnectionState.active ||
                                snapshot.connectionState == ConnectionState.done) {
                              if (snapshot.hasError) {
                                return const Text('Error');
                              } else if (snapshot.hasData) {
                                final reminder = snapshot.data!;
                                return snapshot.data!.isEmpty
                                    ? const Text("Please input a reminder.")
                                    : SizedBox(
                                        height: 200,
                                        child: ListView.builder(
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemCount: snapshot.data!.length < 3 ? snapshot.data!.length : 3,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(bottom: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: ListTile(
                                                leading: Text(
                                                  reminder[index].time,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                horizontalTitleGap: 50,
                                                title: Text(
                                                  reminder[index].name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                subtitle: Text(reminder[index].detail),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                              } else {
                                return const Text('Empty data');
                              }
                            } else {
                              return Text('State: ${snapshot.connectionState}');
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    //activity logs

                    const Text(
                      'Elderly Records',
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),

                    StreamBuilder(
                        stream: DatabaseServices().elders,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.connectionState == ConnectionState.active ||
                              snapshot.connectionState == ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text('Error');
                            } else if (snapshot.hasData) {
                              final elderlyDoc = snapshot.data!;
                              return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: elderlyDoc.length,
                                  itemBuilder: (context, index) {
                                    return StreamBuilder<List<VitalSub>>(
                                        stream: DatabaseServices().elderVital(elderlyDoc[index].uid),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.connectionState == ConnectionState.active ||
                                              snapshot.connectionState == ConnectionState.done) {
                                            if (snapshot.hasError) {
                                              return const Text('Error');
                                            } else if (snapshot.hasData) {
                                              final List<VitalSub> data = snapshot.data!;
                                              print("Vital Sub: ${data[0].toJson()}");
                                              return DashboardRecordTile(
                                                name: elderlyDoc[index].name,
                                                data: data.first,
                                              );
                                            } else {
                                              return const Text('Empty data');
                                            }
                                          } else {
                                            return Text('State: ${snapshot.connectionState}');
                                          }
                                        });
                                  });
                            } else {
                              return const Text('Empty data');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        }),

                    const SizedBox(height: 24),
                    CustomButton(
                      onPressed: () => context.pushRoute(const ElderlyRoute()),
                      label: "View Elderly List",
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
