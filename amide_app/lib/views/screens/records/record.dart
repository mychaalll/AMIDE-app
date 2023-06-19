import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/features/data/services/realtime.dart';
import 'package:amide_app/views/widgets/buttons/step.dart';
import 'package:amide_app/views/widgets/timeline.dart/content.dart';
import 'package:amide_app/views/widgets/timeline.dart/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RecordScreen extends StatefulWidget {
  const RecordScreen({
    Key? key,
    this.elderly,
  }) : super(key: key);

  final Elderly? elderly;

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    final RecordServices record = Provider.of<RecordServices>(context);

    final recordTitleList = [
      "Heart Rate",
      "Height",
      "Oxygen Rate",
      "Body Temperature",
      "Weight",
    ];

    final bodyTextList = [
      "To measure the patient's pulse rate accurately make sure it is snugly secured. Ask the patient to remain still and avoid talking during the reading for the most accurate results.",
      "Height",
      "To measure the patient's blood oxygen level accurately, attach the sensor to the patient's fingertip and ensure it is securely in place. Ask the patient to remain still and avoid moving the hand or finger being used for the reading.",
      "Ensure that the temperature sensor is in contact with the patient's body for at least 1-2 minutes or until a temperature reading is obtained to ensure accurate measurements.",
      "Weight",
    ];

    final vitalTextList = [
      "Normal Heart Rate Range is: 60bpm - 100bpm",
      "",
      "Normal Oxygen Rate: 95% - 100%",
      "Normal Body Temperature: 36.2C - 37C",
      "",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        title: Text(widget.elderly!.name),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            record.updateFinishStep();
            context.popRoute();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      'Recording Data',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // 1st part
                    CustomTimeline(
                      isLast: record.doneFirstStep ? false : true,
                      isDone: record.doneFirstStep,
                      content: TimelineContent(
                        title: "Check all equipments",
                        bodyText:
                            "To ensure accurate recording of patient statistics, it is crucial to confirm that all equipment is properly connected to the patient. Check that all devices are securely attached and functioning correctly before beginning data collection. This will help to avoid any errors or inaccuracies in the recorded data.",
                        isVisible: record.firstStep,
                        toggleDown: () => record.toggleFirstStep(),
                        pressDone: () => record.updateFirstStep(),
                        isDown: record.firstStep,
                        isFirst: true,
                        isDone: record.doneFirstStep,
                        hasRetry: false,
                        isHidden: !record.doneFirstStep,
                      ),
                    ),

                    FirebaseAnimatedList(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        query: Realtime().vital_db,
                        itemBuilder: (context, snapshot, animation, index) {
                          if (snapshot.key == "heartRate") {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              record.updateHeartRate(snapshot.value);
                            });
                          } else if (snapshot.key == "height") {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              record.updateHeight(snapshot.value);
                            });
                          } else if (snapshot.key == "oxygenRate") {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              record.updateOxygenRate(snapshot.value);
                            });
                          } else if (snapshot.key == "temperature") {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              record.updateTemperature(snapshot.value);
                            });
                          } else if (snapshot.key == "weight") {
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              record.updateWeight(snapshot.value);
                            });
                          }

                          return Visibility(
                            visible: record.doneFirstStep,
                            child: CustomTimeline(
                              isFirst: snapshot.value != -1.0 ? false : true,
                              isLast: snapshot.value != -1.0 ? false : true,
                              isDone: snapshot.value != -1.0,
                              content: TimelineContent(
                                title: recordTitleList[index],
                                bodyText: bodyTextList[index],
                                rangeOfVitalSign: vitalTextList[index],
                                isVisible: record.isDropDownList[index],
                                bodyVitalText: snapshot.value.toString(),
                                toggleDown: () => record.toggleIsDropDownList(index),
                                pressDone: () => record.updateFourthStep(),
                                isDone: snapshot.value != -1.0,
                                pressRetry: () {},
                                isDown: record.isDropDownList[index],
                              ),
                            ),
                          );
                        }),

                    // // 6th step
                    Visibility(
                      visible: record.doneFirstStep,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Check all the vital signs before proceeding",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                text: "Heart Rate: ",
                                children: [
                                  TextSpan(text: "29.0 bpm", style: TextStyle(fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                text: "Height: ",
                                children: [
                                  TextSpan(text: "40(in)", style: TextStyle(fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                text: "Oxygen Rate ",
                                children: [
                                  TextSpan(text: "110 % Spo2", style: TextStyle(fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                text: "Body Temperature: ",
                                children: [
                                  TextSpan(text: "95% Celcius", style: TextStyle(fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                text: "Weight: ",
                                children: [
                                  TextSpan(text: "120/23 kg", style: TextStyle(fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: StepButton(
                                onPressed: () async {
                                  // record.updateFinishStep();
                                  // context.popRoute();
                                  await DatabaseServices().sendVital(widget.elderly!.uid, {
                                    "heartRate": record.heartRate,
                                    "height": record.height,
                                    "oxygenRate": record.oxygenRate,
                                    "temperature": record.temperature,
                                    "weight": record.weight,
                                  });
                                  print(widget.elderly!.uid);
                                },
                                title: "Finish",
                                isEnabled: record.isEnabledValidation(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
