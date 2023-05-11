import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

@RoutePage()
class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  bool _step1IsExpanded = false;
  bool _step2IsExpanded = false;
  bool _step3IsExpanded = false;
  bool _step4IsExpanded = false;
  bool _step5IsExpanded = false;
  bool _step6IsExpanded = false;
  bool _step1Done = false;
  bool _step2Done = false;
  bool _step3Done = false;
  bool _step4Done = false;
  bool _step5Done = false;
  final bool _step6Done = false;

  //variables to store recorded stats
  String _temp = '29.0';
  String _bp = '120/80';
  String _bpm = '110';
  String _bol = '95';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        title: const Text('Sample Name'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pushRoute(
              const ElderlyRoute(),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
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
                TimelineTile(
                  isFirst: true,
                  isLast: _step1Done ? false : true,
                  alignment: TimelineAlign.manual,
                  indicatorStyle: IndicatorStyle(
                    indicatorXY: 0.5,
                    drawGap: true,
                    width: 30,
                    height: 30,
                    indicator: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: _step1Done ? Colors.green : Colors.red,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Icon(_step1Done ? Icons.done : Icons.more_horiz,
                          size: 20, color: Colors.white),
                    ),
                  ),
                  lineXY: 0,
                  endChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        _step1IsExpanded = !_step1IsExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _step1Done ? Colors.green : AppColors.primBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: _step1IsExpanded
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Check all equipments',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Icon(
                                      _step1IsExpanded
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: _step1IsExpanded,
                                child: Expanded(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12),
                                          bottomRight: Radius.circular(12)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'To ensure accurate recording of patient statistics, it is crucial to confirm that all equipment is properly connected to the patient. Check that all devices are securely attached and functioning correctly before beginning data collection. This will help to avoid any errors or inaccuracies in the recorded data.',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5),
                                          ),
                                          StepButton(
                                            title: 'Done',
                                            onPressed: () {
                                              setState(() {
                                                _step1Done = true;
                                                _step1IsExpanded = false;
                                              });
                                            },
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
                    ),
                  ),
                ),
                //2nd step - temp
                _step1Done
                    ? TimelineTile(
                        isFirst: false,
                        isLast: _step2Done ? false : true,
                        alignment: TimelineAlign.manual,
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.5,
                          drawGap: true,
                          width: 30,
                          height: 30,
                          indicator: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: _step2Done ? Colors.green : Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(
                                _step2Done ? Icons.done : Icons.more_horiz,
                                size: 20,
                                color: Colors.white),
                          ),
                        ),
                        lineXY: 0,
                        endChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              _step2IsExpanded = !_step2IsExpanded;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _step2Done
                                    ? Colors.green
                                    : AppColors.primBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: _step2IsExpanded
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Body Temperature',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            _step2IsExpanded
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: _step2IsExpanded,
                                      child: Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Ensure that the temperature sensor is in contact with the patient's body for at least 1-2 minutes or until a temperature reading is obtained to ensure accurate measurements.",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5),
                                                ),
                                                const SizedBox(height: 10.0),
                                                _temp == ''
                                                    ? const Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "Measuring...",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.5),
                                                          ),
                                                        ],
                                                      )
                                                    : Text(
                                                        'Temperature: $_temp° Celcius',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.5),
                                                      ),
                                                const SizedBox(height: 10),
                                                _temp != ''
                                                    ? Row(
                                                        children: [
                                                          StepButton(
                                                            title: 'Retry',
                                                            onPressed: () {
                                                              setState(() {
                                                                _temp = '';
                                                                // retry the recording of temp
                                                              });
                                                            },
                                                          ),
                                                          const Spacer(),
                                                          StepButton(
                                                            title: 'Done',
                                                            onPressed: () {
                                                              setState(() {
                                                                _step2Done =
                                                                    true;
                                                                _step2IsExpanded =
                                                                    false;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
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
                          ),
                        ),
                      )
                    : Container(),
                //3rd step - bp
                _step2Done
                    ? TimelineTile(
                        isFirst: false,
                        isLast: _step3Done ? false : true,
                        alignment: TimelineAlign.manual,
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.5,
                          drawGap: true,
                          width: 30,
                          height: 30,
                          indicator: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: _step3Done ? Colors.green : Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(
                                _step3Done ? Icons.done : Icons.more_horiz,
                                size: 20,
                                color: Colors.white),
                          ),
                        ),
                        lineXY: 0,
                        endChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              _step3IsExpanded = !_step3IsExpanded;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _step3Done
                                    ? Colors.green
                                    : AppColors.primBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: _step3IsExpanded
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Blood Pressure',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            _step3IsExpanded
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: _step3IsExpanded,
                                      child: Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Make sure the cuff is wrapped securely around the patient's arm, and that the patient is seated comfortably with their arm supported at heart level. This will help to ensure accurate blood pressure readings.",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5),
                                                ),
                                                const SizedBox(height: 10.0),
                                                _bp == ''
                                                    ? const Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "Measuring...",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.5),
                                                          ),
                                                        ],
                                                      )
                                                    : Text(
                                                        'Blood Pressure: $_bp mmHg',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.5),
                                                      ),
                                                const SizedBox(height: 10),
                                                _bp != ''
                                                    ? Row(
                                                        children: [
                                                          StepButton(
                                                            title: 'Retry',
                                                            onPressed: () {
                                                              setState(() {
                                                                _bp = '';
                                                                // retry the recording of temp
                                                              });
                                                            },
                                                          ),
                                                          const Spacer(),
                                                          StepButton(
                                                            title: 'Done',
                                                            onPressed: () {
                                                              setState(() {
                                                                _step3Done =
                                                                    true;
                                                                _step3IsExpanded =
                                                                    false;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
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
                          ),
                        ),
                      )
                    : Container(),
                //4th step - bpm
                _step3Done
                    ? TimelineTile(
                        isFirst: false,
                        isLast: _step4Done ? false : true,
                        alignment: TimelineAlign.manual,
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.5,
                          drawGap: true,
                          width: 30,
                          height: 30,
                          indicator: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: _step4Done ? Colors.green : Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(
                                _step4Done ? Icons.done : Icons.more_horiz,
                                size: 20,
                                color: Colors.white),
                          ),
                        ),
                        lineXY: 0,
                        endChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              _step4IsExpanded = !_step4IsExpanded;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _step4Done
                                    ? Colors.green
                                    : AppColors.primBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: _step4IsExpanded
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Pulse Rate',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            _step4IsExpanded
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: _step4IsExpanded,
                                      child: Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "To measure the patient's pulse rate accurately make sure it is snugly secured. Ask the patient to remain still and avoid talking during the reading for the most accurate results.",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5),
                                                ),
                                                const SizedBox(height: 10.0),
                                                _bpm == ''
                                                    ? const Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "Measuring...",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.5),
                                                          ),
                                                        ],
                                                      )
                                                    : Text(
                                                        'Pulse Rate: $_bpm bpm',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.5),
                                                      ),
                                                const SizedBox(height: 10),
                                                _bpm != ''
                                                    ? Row(
                                                        children: [
                                                          StepButton(
                                                            title: 'Retry',
                                                            onPressed: () {
                                                              setState(() {
                                                                _bpm = '';
                                                                // retry the recording of temp
                                                              });
                                                            },
                                                          ),
                                                          const Spacer(),
                                                          StepButton(
                                                            title: 'Done',
                                                            onPressed: () {
                                                              setState(() {
                                                                _step4Done =
                                                                    true;
                                                                _step4IsExpanded =
                                                                    false;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
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
                          ),
                        ),
                      )
                    : Container(),
                //5th step - bol
                _step4Done
                    ? TimelineTile(
                        isFirst: false,
                        isLast: _step5Done ? false : true,
                        alignment: TimelineAlign.manual,
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.5,
                          drawGap: true,
                          width: 30,
                          height: 30,
                          indicator: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: _step5Done ? Colors.green : Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(
                                _step5Done ? Icons.done : Icons.more_horiz,
                                size: 20,
                                color: Colors.white),
                          ),
                        ),
                        lineXY: 0,
                        endChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              _step5IsExpanded = !_step5IsExpanded;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _step5Done
                                    ? Colors.green
                                    : AppColors.primBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: _step5IsExpanded
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Blood Oxygen Level',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            _step5IsExpanded
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: _step5IsExpanded,
                                      child: Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "To measure the patient's blood oxygen level accurately, attach the sensor to the patient's fingertip and ensure it is securely in place. Ask the patient to remain still and avoid moving the hand or finger being used for the reading. ",
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[700],
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5),
                                                ),
                                                const SizedBox(height: 10.0),
                                                _bol == ''
                                                    ? const Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                            width: 20,
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "Measuring...",
                                                            textAlign: TextAlign
                                                                .justify,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                height: 1.5),
                                                          ),
                                                        ],
                                                      )
                                                    : Text(
                                                        'Blood Oxygen Level: $_bol% SpO2',
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 1.5),
                                                      ),
                                                const SizedBox(height: 10),
                                                _bol != ''
                                                    ? Row(
                                                        children: [
                                                          StepButton(
                                                            title: 'Retry',
                                                            onPressed: () {
                                                              setState(() {
                                                                _bol = '';
                                                                // retry the recording of temp
                                                              });
                                                            },
                                                          ),
                                                          const Spacer(),
                                                          StepButton(
                                                            title: 'Done',
                                                            onPressed: () {
                                                              setState(() {
                                                                _step5Done =
                                                                    true;
                                                                _step5IsExpanded =
                                                                    false;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
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
                          ),
                        ),
                      )
                    : Container(),
                // 1st part
                _step5Done
                    ? TimelineTile(
                        isFirst: false,
                        isLast: true,
                        alignment: TimelineAlign.manual,
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.5,
                          drawGap: true,
                          width: 30,
                          height: 30,
                          indicator: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: _step6Done ? Colors.green : Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Icon(
                                _step6Done ? Icons.done : Icons.more_horiz,
                                size: 20,
                                color: Colors.white),
                          ),
                        ),
                        lineXY: 0,
                        endChild: GestureDetector(
                          onTap: () {
                            setState(() {
                              _step6IsExpanded = !_step6IsExpanded;
                            });
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: _step6Done
                                    ? Colors.green
                                    : AppColors.primBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment: _step6IsExpanded
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Finish Recording',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Icon(
                                            _step1IsExpanded
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: _step6IsExpanded,
                                      child: Expanded(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(12),
                                                bottomRight:
                                                    Radius.circular(12)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Please check if all of the statistics taken are accurate.',
                                                  textAlign: TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'Temperature: $_temp° Celcius\n Blood Pressure: $_bp mmHg\n Pulse Rate: $_bpm bpm\n Blood Oxygen Level: $_bol% SpO2 ',
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.5),
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    const Spacer(),
                                                    StepButton(
                                                      title: 'Finish',
                                                      onPressed: () {
                                                        context.pushRoute(
                                                          const ElderlyRoute(),
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StepButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const StepButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
            overlayColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 2, 5, 27)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
        child: SizedBox(
          width: 80,
          height: 30,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
