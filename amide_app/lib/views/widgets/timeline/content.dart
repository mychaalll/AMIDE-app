import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/features/data/services/realtime.dart';
import 'package:amide_app/views/widgets/buttons/step.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({
    Key? key,
    required this.index,
    required this.label,
    required this.bodyText,
    this.rangeOfVitalSign,
    this.vitalSign,
    this.hasDone = false,
  }) : super(key: key);

  final int index;
  final String label;
  final String bodyText;
  final String? rangeOfVitalSign;
  final String? vitalSign;
  final bool hasDone;

  @override
  Widget build(BuildContext context) {
    final RecordServices record = Provider.of<RecordServices>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          record.toggleRecordDropdown(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: record.doneList[index] ? Colors.green : AppColors.primBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      record.dropdownList[index] ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: record.dropdownList[index],
                child: Container(
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
                      Text(
                        bodyText,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        rangeOfVitalSign ?? "",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        vitalSign ?? "",
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
                      // isBloodPressure
                      //     ? Column(
                      //         children: [
                      //           Row(
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: [
                      //               Expanded(
                      //                 child: CustomTextField(
                      //                   label: "Systolic",
                      //                   hintText: "Systolic",
                      //                   keyboardType: TextInputType.number,
                      //                   controller: record.systolic,
                      //                   icon: IconButton(
                      //                     onPressed: () {},
                      //                     icon: const CircleAvatar(
                      //                       child: Icon(Icons.arrow_right),
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           const SizedBox(
                      //             height: 5,
                      //           ),
                      //           CustomTextField(
                      //             label: "Diastolic",
                      //             hintText: "Diastolic",
                      //             keyboardType: TextInputType.number,
                      //             controller: record.diastolic,
                      //             icon: IconButton(
                      //               onPressed: () {},
                      //               icon: const CircleAvatar(
                      //                 child: Icon(Icons.arrow_right),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )
                      //     : const SizedBox.shrink(),
                      hasDone
                          ? Visibility(
                              visible: !record.doneList[0] == true,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: StepButton(
                                  title: "Done",
                                  onPressed: () async {
                                    await Realtime().recordData(context);
                                    record.toggleRecordDropdown(0);
                                    record.toggleDone(0);
                                  },
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomLeft,
                              child: StepButton(
                                title: "Retry",
                                onPressed: () async {
                                  await Realtime().resetData(context, index);
                                },
                                backgroundColor: Colors.red,
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
  }
}
