import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/provider/recording.dart';
import 'package:amide_app/views/widgets/buttons/step.dart';
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
    this.isDown = false,
    this.hasRetry = true,
    this.isFinish = false,
    this.isDone = false,
    this.isBloodPressure = false,
  }) : super(key: key);

  final bool isVisible;
  final String bodyText;
  final String? bodyVitalText;
  final String title;
  final Function()? toggleDown;
  final Function()? pressDone;
  final bool isDown;
  final bool hasRetry;
  final bool isFinish;
  final bool isDone;
  final bool isBloodPressure;

  @override
  Widget build(BuildContext context) {
    final RecordServices record = Provider.of<RecordServices>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: isDone ? Colors.green : AppColors.primBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: toggleDown,
              child: Padding(
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
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Systolic",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                      ),
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      children: List.generate(
                                        9,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            print(index);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: AppColors.primBlue,
                                            ),
                                            child: Text(
                                              "$index",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).toList(),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text(
                                      "Diastolic",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5,
                                      ),
                                    ),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      children: List.generate(
                                        9,
                                        (index) => GestureDetector(
                                          onTap: () {
                                            print(index);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              color: AppColors.primBlue,
                                            ),
                                            child: Text(
                                              "$index",
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: hasRetry,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: StepButton(
                              title: "Retry",
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: StepButton(
                            title: isFinish ? "Finish" : "Done",
                            onPressed: pressDone,
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
    );
  }
}
