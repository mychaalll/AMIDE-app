import 'package:amide_app/features/presentation/elderly/widgets/elderly_details.dart';
import 'package:amide_app/features/presentation/records/screens/recording_screen.dart';
import 'package:amide_app/features/data/provider/elderlyData.dart';
import 'package:amide_app/features/presentation/elderly/screens/edit_elderly_screen.dart';
import 'package:amide_app/features/presentation/elderly/screens/elderly_screen.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../data/models/elderly.dart';
import '../widgets/elderly_records.dart';

class ViewElderlyScreen extends StatelessWidget {
  ViewElderlyScreen({super.key});

  // sample list for temp
  final List<double> tempSummary = [
    38.6,
    32,
    35.5,
    37.9,
    42.9,
    31.4,
    36.2,
  ];

  //sample list for bpm
  final List<double> bpmSummary = [
    69,
    87,
    98,
    64,
    79,
    90,
    84,
  ];

  //sample list for blood oxygen level(bol)
  final List<double> bolSummary = [
    99,
    97,
    98,
    94,
    92,
    90,
    84,
  ];

  // boolean to remove the record button if theres an existing record for the day,
  // set to true if theres an available record
  bool todayHasRecord = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<ElderlyData>(
      builder: (context, value, child) {
        Elderly currentElderly = value.getActiveElderly();
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: AppColors.primBlue,
              centerTitle: true,
              elevation: 0,
              title: Text(currentElderly.name.toString()),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: ElderlyScreen(),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              actions: [
                todayHasRecord == true
                    ? IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: RecordingScreen(),
                              type: PageTransitionType.leftToRight,
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add_chart,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: EditElderlyScreen(
                          currentElderly: currentElderly,
                        ),
                        type: PageTransitionType.leftToRight,
                      ),
                    );
                  },
                  icon: Icon(
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
                      height: 120,
                      color: AppColors.primBlue,
                      child: Center(
                        child: Column(children: [
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      currentElderly.age,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )),
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
                                    SizedBox(height: 10),
                                    Text(
                                      currentElderly.sex,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Spacer(),
                          TabBar(
                            tabs: [
                              Tab(
                                text: 'Details',
                              ),
                              Tab(
                                text: 'Records',
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ElderlyDetails(
                            description: currentElderly.description,
                          ),
                          ElderlyRecords(
                            temp: '38',
                            tempSummary: tempSummary,
                            bpm: '69',
                            bpmSummary: bpmSummary,
                            bol: '97',
                            bolSummary: bolSummary,
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
      },
    );
  }
}
