import 'package:amide_app/components/all-records-listview.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AllRecordsPage extends StatelessWidget {

  //temporary variables, remove if records from patient is available
  int listviewCount = 4;
  AllRecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        title: Text(
          'Elderly name here', // elderly name
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Records List',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: listviewCount == 0
                ?
                Container(
                  width: width,
                  child: Column(
                    children: [
                      SizedBox(height: 60),
                      Icon(
                        Icons.cancel_sharp,
                        size: 100,
                      ),
                      Text(
                        'No Records',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                )
                :ListView.builder(
                    itemCount: listviewCount,
                    itemBuilder: ((context, index) {
                      return AllRecordsListView(
                        date: 'Dec. 10, 2022, 09:00 AM',
                        temp: '35.7',
                        bp: '90/80',
                        bpm: '85',
                        bol: '98',
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}