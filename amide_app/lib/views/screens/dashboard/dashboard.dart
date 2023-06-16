import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/reminder.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/views/widgets/buttons/custom.dart';
import 'package:amide_app/views/widgets/dashboard/dashboard_record_tile.dart';
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReminderData>(builder: (context, value, child) {
        // final reminderLength = value.reminderCount;
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
                            fontWeight: FontWeight.w600, fontSize: 16, fontFamily: 'Montserrat', color: Colors.black),
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
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Incoming Reminders',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 22),
                        StreamBuilder(
                          stream: DatabaseServices().reminders,
                          builder: (context, snapshot) {
                            final reminder = snapshot.data;

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
                                              reminder![index].time,
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
                          },
                        ),
                        //   reminderLength == 0
                        //       ? const Text("Please input a reminder.")
                        //       : SizedBox(
                        //           height: 200,
                        //           child: ListView.builder(
                        //             physics: const NeverScrollableScrollPhysics(),
                        //             itemCount: reminderLength < 3 ? reminderLength : 3,
                        //             itemBuilder: (context, index) {
                        //               final currentReminder = value.getReminder(index);
                        //               return Container(
                        //                 padding: const EdgeInsets.all(10),
                        //                 margin: const EdgeInsets.only(bottom: 10),
                        //                 decoration: BoxDecoration(
                        //                   color: Colors.white,
                        //                   borderRadius: BorderRadius.circular(10),
                        //                 ),
                        //                 child: ListTile(
                        //                   leading: Text(
                        //                     currentReminder.time,
                        //                     style: const TextStyle(
                        //                       fontWeight: FontWeight.w700,
                        //                     ),
                        //                   ),
                        //                   horizontalTitleGap: 50,
                        //                   title: Text(
                        //                     currentReminder.name,
                        //                     style: const TextStyle(
                        //                       fontWeight: FontWeight.w700,
                        //                       fontSize: 20,
                        //                     ),
                        //                   ),
                        //                   subtitle: Text(currentReminder.detail),
                        //                 ),
                        //               );
                        //             },
                        //           ),
                        //         ),
                        //   const SizedBox(height: 22),
                        //   ElevatedButton(
                        //       onPressed: () {
                        //         context.pushRoute(
                        //           const ReminderRoute(),
                        //         );
                        //       },
                        //       style: ButtonStyle(
                        //           backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
                        //           overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 2, 5, 27)),
                        //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(12),
                        //           ))),
                        //       child: const SizedBox(
                        //         height: 40,
                        //         child: Center(
                        //           child: Text(
                        //             'View Reminders',
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.w600,
                        //               fontSize: 12,
                        //               fontFamily: 'Montserrat',
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //       ))
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
                        if (snapshot.hasData) {
                          final elderlyDoc = snapshot.data;
                          print(elderlyDoc);
                          return elderlyDoc!.isEmpty
                              ? const Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 60),
                                      Icon(
                                        Icons.cancel_sharp,
                                        size: 100,
                                      ),
                                      Text(
                                        'No Elderlies',
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
                                  height: 300,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: elderlyDoc.length,
                                    itemBuilder: (context, index) {
                                      return StreamBuilder(
                                          stream: DatabaseServices().elderVital(elderlyDoc[index].uid),
                                          builder: (context, snapshot) {
                                            print("Snapshot ${snapshot.data}");

                                            if (snapshot.hasData) {
                                              return DashboardRecordTile(
                                                name: elderlyDoc[index].name,
                                                celcius: snapshot.data.first,
                                              );
                                            } else if (snapshot.hasError) {
                                              return Center(
                                                child: Text("${snapshot.error}"),
                                              );
                                            }
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          });
                                    },
                                  ),
                                );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),

                    CustomButton(
                      onPressed: () {},
                      label: "View Elderly List",
                    ),

                    // StreamBuilder(
                    //   stream: DatabaseServices().elderVital(),
                    //   builder: (context, snapshot) {
                    //     final data = snapshot.data?.docs;
                    //     print(data?[0].data());

                    //     if (snapshot.hasData) {
                    //       // return SizedBox(
                    //       //   height: 500,
                    //       //   child: ListView.builder(
                    //       //       shrinkWrap: true,
                    //       //       itemCount: data?.length,
                    //       //       itemBuilder: (context, index) {
                    //       //         return DashboardRecordTile(
                    //       //           name: name,
                    //       //           celcius: data![index].get("temperature"),
                    //       //         );
                    //       //       }),
                    //       // );
                    //     } else if (snapshot.hasError) {
                    //       return Center(
                    //         child: Text("${snapshot.error}"),
                    //       );
                    //     }
                    //     return const Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   },
                    // ),

                    // Column(children: [
                    //   const Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text(
                    //       'Elderly Records',
                    //       textAlign: TextAlign.left,
                    //       overflow: TextOverflow.ellipsis,
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.w700, fontSize: 20, fontFamily: 'Montserrat', color: Colors.black),
                    //     ),
                    //   ),
                    //   const SizedBox(height: 22),
                    //   const DashboardRecordTile(
                    //     name: 'John Wick',
                    //     temp: '37.9',
                    //     time: '07:00 AM',
                    //     bp: '120/80',
                    //     bpm: '80',
                    //     bol: '96',
                    //   ),
                    //   const SizedBox(height: 11),
                    //   const DashboardRecordTile(
                    //     name: 'Ai Hoshino',
                    //     temp: '35.7',
                    //     time: '09:00 AM',
                    //     bp: '90/80',
                    //     bpm: '85',
                    //     bol: '98',
                    //   ),
                    //   const SizedBox(height: 11),
                    //   const DashboardRecordTile(
                    //     name: 'Juan Dela Cruz',
                    //     temp: '38.5',
                    //     time: '03:00 PM',
                    //     bp: '110/80',
                    //     bpm: '99',
                    //     bol: '96',
                    //   ),
                    //   const SizedBox(height: 22),
                    //   ElevatedButton(
                    //       onPressed: () {
                    //         context.pushRoute(
                    //           const ElderlyRoute(),
                    //         );
                    //       },
                    //       style: ButtonStyle(
                    //           backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
                    //           overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 2, 5, 27)),
                    //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(12),
                    //           ))),
                    //       child: const SizedBox(
                    //         height: 40,
                    //         child: Center(
                    //           child: Text(
                    //             'View Elderly List',
                    //             style: TextStyle(
                    //               fontWeight: FontWeight.w600,
                    //               fontSize: 12,
                    //               fontFamily: 'Montserrat',
                    //               color: Colors.white,
                    //             ),
                    //           ),
                    //         ),
                    //       ))
                    // ]),
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
