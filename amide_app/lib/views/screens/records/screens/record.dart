import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/views/widgets/timeline.dart/content.dart';
import 'package:amide_app/views/widgets/timeline.dart/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {
    final RecordServices record = Provider.of<RecordServices>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        title: const Text('Sample Name'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     context.pushRoute(const RecordingRoute());
              //   },
              //   child: const Text(""),
              // ),
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
                  isDone: record.doneFirstStep,
                  hasRetry: false,
                ),
              ),
              // 2nd part
              Visibility(
                visible: record.doneFirstStep,
                child: CustomTimeline(
                  isFirst: record.doneFirstStep ? false : true,
                  isLast: record.doneSecondStep ? false : true,
                  isDone: record.doneSecondStep,
                  content: TimelineContent(
                    title: "Body Temperature",
                    bodyText:
                        "Ensure that the temperature sensor is in contact with the patient's body for at least 1-2 minutes or until a temperature reading is obtained to ensure accurate measurements.",
                    bodyVitalText: "Temperature: 29.0 Celcius",
                    isVisible: record.secondStep,
                    toggleDown: () => record.toggleSecondStep(),
                    pressDone: () => record.updateSecondStep(),
                    isDone: record.doneSecondStep,
                    isDown: record.secondStep,
                  ),
                ),
              ),
              // 3rd part
              Visibility(
                visible: record.doneSecondStep,
                child: CustomTimeline(
                  isFirst: record.doneSecondStep ? false : true,
                  isLast: record.doneThirdStep ? false : true,
                  isDone: record.doneThirdStep,
                  content: TimelineContent(
                    title: "Blood Pressure",
                    bodyText:
                        "Make sure the cuff is wrapped securely around the patient's arm, adn that the patient is seated comfortably with their arm supported at heart level. This will help to ensure accurate blood pressure readings.",
                    bodyVitalText: "Blood Pressure: 120/80 mmHg",
                    isVisible: record.thirdStep,
                    toggleDown: () => record.toggleThirdStep(),
                    pressDone: () => record.updateThirdStep(),
                    isDone: record.doneThirdStep,
                    isDown: record.thirdStep,
                  ),
                ),
              ),
              // 4th part
              Visibility(
                visible: record.doneThirdStep,
                child: CustomTimeline(
                  isFirst: record.doneThirdStep ? false : true,
                  isLast: record.doneFourthStep ? false : true,
                  isDone: record.doneFourthStep,
                  content: TimelineContent(
                    title: "Pulse Rate",
                    bodyText:
                        "To measure the patient's pulse rate accurately make sure it is snugly secured. Ask the patient to remain still and avoid talking during the reading for the most accurate results.",
                    bodyVitalText: "Pulse Rate: 110 bpm",
                    isVisible: record.fourthStep,
                    toggleDown: () => record.toggleFourthStep(),
                    pressDone: () => record.updateFourthStep(),
                    isDone: record.doneFourthStep,
                    isDown: record.fourthStep,
                  ),
                ),
              ),
              // 5th step
              Visibility(
                visible: record.doneFourthStep,
                child: CustomTimeline(
                  isFirst: record.doneFourthStep ? false : true,
                  isLast: record.doneFifthStep ? false : true,
                  isDone: record.doneFifthStep,
                  content: TimelineContent(
                    title: "Blood Oxygen Level",
                    bodyText:
                        "To measure the patient's blood oxygen level accurately, attach the sensor to the patient's fingertip and ensure it is securely in place. Ask the patient to remain still and avoid moving the hand or finger being used for the reading.",
                    bodyVitalText: "Bloox Oxygen Level: 95% SpO2",
                    isVisible: record.fifthStep,
                    toggleDown: () => record.toggleFifthStep(),
                    pressDone: () => record.updateFifthStep(),
                    isDone: record.doneFifthStep,
                    isDown: record.fifthStep,
                  ),
                ),
              ),
              // 6th step
              Visibility(
                visible: record.doneFifthStep,
                child: CustomTimeline(
                  isFirst: record.doneFifthStep ? false : true,
                  isLast: true,
                  isDone: record.doneSixthStep,
                  content: TimelineContent(
                    title: "Finish Recroding",
                    bodyText: "Please check if all of the statistics taken are accurate.",
                    bodyVitalText:
                        "Temperature: 29.0 Celcius\nBlood Pressure: 120/80mmHg\nPulse Rate: 110 bpm\nBlood Oxygen Level: 95% SpO2",
                    isVisible: record.sixthStep,
                    toggleDown: () => record.toggleSixthStep(),
                    pressDone: () {
                      record.updateSixthStep();
                      context.popRoute();
                    },
                    isDone: record.doneSixthStep,
                    isDown: record.sixthStep,
                    hasRetry: false,
                    isFinish: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
