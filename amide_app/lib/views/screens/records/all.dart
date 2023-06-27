import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/models/records/vital_sub.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/views/widgets/records/tile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class AllRecordsScreen extends StatelessWidget {
  //temporary variables, remove if records from patient is available
  final int listviewCount = 4;
  const AllRecordsScreen({
    this.elderly,
    super.key,
  });

  final Elderly? elderly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        title: Text(
          elderly!.name, // elderly name
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: DatabaseServices().streamVital(elderly!.uid),
          builder: (context, snapshot) {
            final temperature = snapshot.data?.map((VitalSub vitalSub) => vitalSub.temperature).toList();
            final heartRate = snapshot.data?.map((VitalSub vitalSub) => vitalSub.heartRate).toList();
            final oxygenRate = snapshot.data?.map((VitalSub vitalSub) => vitalSub.oxygenRate).toList();
            final systolic = snapshot.data?.map((VitalSub vitalSub) => vitalSub.systolic).toList();
            final diastolic = snapshot.data?.map((VitalSub vitalSub) => vitalSub.diastolic).toList();
            final timeStamp = snapshot.data?.map((VitalSub vitalSub) => vitalSub.timeStamp).toList();
            final height = snapshot.data?.map((VitalSub vitalSub) => vitalSub.height).toList();
            final weight = snapshot.data?.map((VitalSub vitalSub) => vitalSub.weight).toList();

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return snapshot.data!.isEmpty
                ? const Column(
                    children: [
                      SizedBox(height: 60),
                      Icon(
                        Icons.cancel_sharp,
                        size: 100,
                      ),
                      Text(
                        'No Records yet',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18, fontFamily: 'Montserrat', color: Colors.black),
                      ),
                    ],
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final String date = DateFormat("MMMM dd, yyyy ").format(timeStamp![index]!.toDate());

                      return RecordTile(
                        vital: VitalSub(
                          temperature: temperature![index],
                          heartRate: heartRate![index],
                          oxygenRate: oxygenRate![index],
                          systolic: systolic![index],
                          diastolic: diastolic![index],
                          timeStamp: timeStamp[index],
                          height: height![index],
                          weight: weight![index],
                        ),
                        date: date,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
