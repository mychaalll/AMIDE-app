import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/features/data/services/realtime.dart';
import 'package:amide_app/views/widgets/buttons/step.dart';
import 'package:amide_app/views/widgets/fields/custom.dart';
import 'package:amide_app/views/widgets/timeline/content.dart';
import 'package:amide_app/views/widgets/timeline/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    return Stack(
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primBlue,
              title: Text(widget.elderly!.name),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  record.clearRecord();
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
                            isDone: record.doneList[0] == true,
                            isLast: record.doneList[0] == false,
                            content: const TimelineContent(
                              label: "Check all equipments",
                              bodyText:
                                  "To ensure accurate recording of patient statistics, it is crucial to confirm that all equipment is properly connected to the patient. Check that all devices are securely attached and functioning correctly before beginning data collection. This will help to avoid any errors or inaccuracies in the recorded data.",
                              hasDone: true,
                              index: 0,
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
                                visible: record.doneList[0] == true,
                                child: CustomTimeline(
                                  isFirst: snapshot.value == -1,
                                  isLast: snapshot.value == -1,
                                  isDone: snapshot.value != -1,
                                  content: TimelineContent(
                                    index: index + 1,
                                    label: record.recordTitleList[index],
                                    bodyText: record.bodyTextList[index],
                                    rangeOfVitalSign: record.rangeOfVitalSignList[index],
                                    vitalSign: ("${snapshot.value} ${record.vitalUnit[index]}"),
                                  ),
                                ),
                              );
                            },
                          ),

                          /// Blood Pressure
                          Visibility(
                            visible: record.doneList[0] == true,
                            child: TimelineTile(
                              isFirst: record.bpValue == null,
                              isLast: record.bpValue == null,
                              alignment: TimelineAlign.manual,
                              indicatorStyle: IndicatorStyle(
                                indicatorXY: 0.5,
                                drawGap: true,
                                width: 30,
                                height: 30,
                                indicator: Container(
                                  decoration: BoxDecoration(
                                    color: record.bpValue != null ? Colors.green : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    record.bpValue != null ? Icons.done : Icons.more_horiz,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              lineXY: 0,
                              endChild: GestureDetector(
                                onTap: () => record.toggleDropdownBp(),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primBlue,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Blood Pressure",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_drop_down_sharp,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: record.dropDownBp,
                                          child: Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(12),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Rest: Sit quietly for at least 5 minutes before taking your blood pressure. Position: Sit with your back supported and feet flat on the ground. Your arm should be supported at heart level. Cuff placement: Place the blood pressure cuff on your upper arm, snug but not too tight.Relax: Avoid talking or moving during the measurement. Multiple readings: Take two or three readings, spaced a few minutes apart, and calculate the average for a more accurate result.",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const Text(
                                                  "Normal Blood Pressure: Less than 120/80 mmHg",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                Text(
                                                  "${record.bpValue ?? 0} mmHg",
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: CustomTextField(
                                                        label: "Systolic",
                                                        hintText: "--",
                                                        keyboardType: const TextInputType.numberWithOptions(),
                                                        controller: record.systolic,
                                                        icon: IconButton(
                                                          onPressed: () => record.updateBpValue(),
                                                          icon: const CircleAvatar(
                                                            child: Icon(Icons.arrow_right),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Expanded(
                                                      child: CustomTextField(
                                                        label: "Diastolic",
                                                        hintText: "--",
                                                        keyboardType: const TextInputType.numberWithOptions(),
                                                        controller: record.diastolic,
                                                        icon: IconButton(
                                                          onPressed: () => record.updateBpValue(),
                                                          icon: const CircleAvatar(
                                                            child: Icon(Icons.arrow_right),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Done step
                          Visibility(
                            visible: record.doneList[0] == true,
                            child: TimelineTile(
                              isFirst: !record.isEnabledValidation(),
                              isLast: true,
                              indicatorStyle: IndicatorStyle(
                                indicatorXY: 0.5,
                                drawGap: true,
                                width: 30,
                                height: 30,
                                indicator: Container(
                                  decoration: BoxDecoration(
                                    color: record.bpValue != null ? Colors.green : Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    record.bpValue != null ? Icons.done : Icons.more_horiz,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              endChild: Padding(
                                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
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
                                        text: TextSpan(
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                          text: "Heart Rate: ",
                                          children: [
                                            TextSpan(
                                                text: "${record.heartRate} bpm",
                                                style: const TextStyle(fontWeight: FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                          text: "Height: ",
                                          children: [
                                            TextSpan(
                                                text: "${record.height}cm",
                                                style: const TextStyle(fontWeight: FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                          text: "Oxygen Rate ",
                                          children: [
                                            TextSpan(
                                                text: "${record.oxygenRate} % Spo2",
                                                style: const TextStyle(fontWeight: FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                          text: "Body Temperature: ",
                                          children: [
                                            TextSpan(
                                                text: "${record.temperature}° Celcius",
                                                style: const TextStyle(fontWeight: FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                          text: "Weight: ",
                                          children: [
                                            TextSpan(
                                                text: "${record.weight} kg",
                                                style: const TextStyle(fontWeight: FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                                          text: "Blood Pressure: ",
                                          children: [
                                            TextSpan(
                                                text: "${record.bpValue} mmHg",
                                                style: const TextStyle(fontWeight: FontWeight.normal)),
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
                                            await DatabaseServices()
                                                .sendVital(
                                                    widget.elderly!.uid,
                                                    VitalSub(
                                                      heartRate: record.heartRate!,
                                                      height: record.height!,
                                                      oxygenRate: record.oxygenRate!,
                                                      temperature: record.temperature!,
                                                      weight: record.weight!,
                                                      systolic: double.parse(record.systolic.text),
                                                      diastolic: double.parse(record.diastolic.text),
                                                      timeStamp: Timestamp.fromDate(DateTime.now()),
                                                    ).toJson())
                                                .then((value) {
                                              record.clearRecord();
                                              context.popRoute();
                                            });
                                          },
                                          title: "Finish",
                                          isEnabled: record.isEnabledValidation(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
          ),
        ),
        Visibility(
          visible: record.isLoading,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.9),
            ),
            child: const Center(
              child: SpinKitPumpingHeart(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
