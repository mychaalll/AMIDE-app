import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/features/data/services/realtime.dart';
import 'package:amide_app/views/widgets/buttons/step.dart';
import 'package:amide_app/views/widgets/fields/custom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimelineContent extends StatelessWidget {
  const TimelineContent({
    Key? key,
    this.isVisible = false,
    required this.bodyText,
    this.bodyVitalText,
    required this.title,
    required this.toggleDown,
    required this.pressDone,
    this.rangeOfVitalSign,
    this.pressRetry,
    this.isDown = false,
    this.hasRetry = true,
    this.isFirst = false,
    this.isDone = false,
    this.isBloodPressure = false,
    this.isHidden = false,
  }) : super(key: key);

  final bool isVisible;
  final String bodyText;
  final String? rangeOfVitalSign;
  final String? bodyVitalText;
  final String title;
  final Function()? toggleDown;
  final Function()? pressDone;
  final Function()? pressRetry;
  final bool isDown;
  final bool hasRetry;
  final bool isFirst;
  final bool isDone;
  final bool isBloodPressure;
  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    final RecordServices record = Provider.of<RecordServices>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: GestureDetector(
        onTap: toggleDown,
        child: Container(
          decoration: BoxDecoration(
            color: isDone ? Colors.green : AppColors.primBlue,
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
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      isDown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
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
                        bodyVitalText ?? "",
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
                      isBloodPressure
                          ? Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        label: "Systolic",
                                        hintText: "Systolic",
                                        keyboardType: TextInputType.number,
                                        controller: record.systolic,
                                        icon: IconButton(
                                          onPressed: () {},
                                          icon: const CircleAvatar(
                                            child: Icon(Icons.arrow_right),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomTextField(
                                  label: "Diastolic",
                                  hintText: "Diastolic",
                                  keyboardType: TextInputType.number,
                                  controller: record.diastolic,
                                  icon: IconButton(
                                    onPressed: () {},
                                    icon: const CircleAvatar(
                                      child: Icon(Icons.arrow_right),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      isFirst
                          ? Visibility(
                              visible: isHidden,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: StepButton(
                                  title: "Done",
                                  onPressed: () async {
                                    await Realtime().recordData(context);
                                    record.updateFirstStep();
                                  },
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomLeft,
                              child: StepButton(
                                title: "Retry",
                                onPressed: pressRetry,
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
