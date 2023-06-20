import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/views/screens/elderly/pages/details.dart';
import 'package:amide_app/views/screens/elderly/pages/records.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewElderlyScreen extends StatelessWidget {
  const ViewElderlyScreen({
    Key? key,
    required this.elderly,
  }) : super(key: key);

  final Elderly elderly;

// boolean to remove the record button if theres an existing record for the day,
  final bool todayHasRecord = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.primBlue,
          centerTitle: true,
          elevation: 0,
          title: Text(elderly.name),
          leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            // todayHasRecord == true
            //     ? IconButton(
            //         onPressed: () {
            //           context.pushRoute(
            //             const RecordingRoute(),
            //           );
            //         },
            //         icon: const Icon(
            //           Icons.add_chart,
            //           size: 20,
            //           color: Colors.white,
            //         ),
            //       )
            //     : Container(),
            IconButton(
              onPressed: () {
                context.pushRoute(
                  RecordRoute(elderly: elderly),
                );
              },
              icon: const Icon(
                Icons.add_chart,
                size: 20,
                color: Colors.white,
              ),
            ),

            IconButton(
              onPressed: () {
                context.pushRoute(
                  EditElderlyRoute(
                    elderly: elderly,
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            color: AppColors.bgColor,
            child: Column(
              children: [
                Container(
                  height: 180,
                  color: AppColors.primBlue,
                  child: Center(
                    child: Column(
                      children: [
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "Age",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${elderly.age}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Sex',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      elderly.sex,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Blood Type',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      elderly.bloodType,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Expanded(
                        //         child: Column(
                        //           children: [
                        //             Text(
                        //               'Height',
                        //               style: TextStyle(
                        //                 fontSize: 14,
                        //                 color: Colors.grey[400],
                        //                 fontWeight: FontWeight.w600,
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //             const SizedBox(height: 10),
                        //             Text(
                        //               "${elderly.height}",
                        //               style: const TextStyle(
                        //                 fontSize: 20,
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.w700,
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Expanded(
                        //         child: Column(
                        //           children: [
                        //             Text(
                        //               'Weight',
                        //               style: TextStyle(
                        //                 fontSize: 14,
                        //                 color: Colors.grey[400],
                        //                 fontWeight: FontWeight.w600,
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //             const SizedBox(height: 10),
                        //             Text(
                        //               "${elderly.weight}",
                        //               style: const TextStyle(
                        //                 fontSize: 20,
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.w700,
                        //                 overflow: TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        const Spacer(),
                        const TabBar(
                          tabs: [
                            Tab(
                              text: 'Details',
                            ),
                            Tab(
                              text: 'Records',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      ElderlyDetails(
                        description: elderly.description ?? "",
                      ),
                      ElderlyRecords(
                        elderly: elderly,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
