import 'package:amide_app/models/elderly.dart';
import 'package:amide_app/models/elderlyData.dart';
import 'package:amide_app/pages/edit/edit-elderly-page.dart';
import 'package:amide_app/pages/journal/elderly-page.dart';
import 'package:amide_app/pages/reminder/reminder-page.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ViewElderly extends StatefulWidget {
  const ViewElderly({super.key});

  @override
  State<ViewElderly> createState() => _ViewElderlyState();
}

List<String> list = <String>['Male', 'Female'];

class _ViewElderlyState extends State<ViewElderly> {
  String _elderlyName = 'Sample Text 1';
  String _elderlyAge = '69';
  String _elderlySex = 'Male';
  String _elderlyDetails = 'Sample Text 2';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<ElderlyData>(
      builder: ((context, value, child) {
        Elderly currentElderly = value.getActiveElderly();
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppColors.primBlue,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    child: ElderlyPage(),
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
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: EditElderly(
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'View Entry',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Elderly Name',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 40,
                      width: width - 30,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "${currentElderly.name}",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: [
                        //age
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Age',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              width: width / 2 - 32,
                              child: TextField(
                                readOnly: true,
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.bottom,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 5.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: "${currentElderly.age}",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 32),
                        //sex
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Sex',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              height: 40,
                              width: width / 2 - 32,
                              child: TextField(
                                readOnly: true,
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.bottom,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 5.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  hintText: "${currentElderly.sex}",
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    //note
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Journal Details',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        width: width - 30,
                        child: TextField(
                          readOnly: true,
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.bottom,
                          maxLines: 15,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 5.0,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: "${currentElderly.description}",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
