import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/elderlyData.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/core/config/toast.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/elderly.dart';

@RoutePage()
class EditElderlyScreen extends StatefulWidget {
  final Elderly currentElderly;
  const EditElderlyScreen({super.key, required this.currentElderly});

  @override
  State<EditElderlyScreen> createState() => _EditElderlyScreenState();
}

List<String> sexList = <String>['Male', 'Female'];

class _EditElderlyScreenState extends State<EditElderlyScreen> {
  late String newName;
  late String newSex;
  late String newAge;
  late bool newActive;
  late String newDescription;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  String sex = sexList.first;

  @override
  void initState() {
    // TODO: implement initState
    _nameController.text = widget.currentElderly.name;
    newName = widget.currentElderly.name;

    _ageController.text = widget.currentElderly.age;
    newAge = widget.currentElderly.name;

    _descriptionController.text = widget.currentElderly.description;
    newDescription = widget.currentElderly.description;

    newSex = widget.currentElderly.sex;
    super.initState();
  }

  void _editElderly() {
    if (newName == null) {
      toastWidget("Give entry a name");
      return;
    }

    Provider.of<ElderlyData>(context, listen: false).editElderly(
      elderly: Elderly(
        name: newName,
        age: newAge,
        sex: newSex,
        description: newDescription,
      ),
      elderlyKey: widget.currentElderly.key,
    );
    context.popRoute();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.primBlue,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.pushRoute(
                ElderlyRoute(),
              );
            },
            icon: Icon(
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
                      SizedBox(height: 20),
                      Text(
                        'Edit Entry',
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
                          controller: _nameController,
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
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onChanged: (value) {
                            newName = value;
                          },
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
                                  'Age Name',
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
                                  keyboardType: TextInputType.number,
                                  controller: _ageController,
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
                                    hintText: 'Age',
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      newAge = value;
                                    });
                                  },
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
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black54,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: sex,
                                      icon: Icon(Icons.arrow_drop_down_circle),
                                      elevation: 1,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      items: sexList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            "Male",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          sex = value!;
                                        });
                                      },
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
                            controller: _descriptionController,
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
                              hintText: 'Some important notes here...',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                newDescription = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      //button
                      ElevatedButton(
                        onPressed: () {
                          _editElderly();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.primBlue),
                            overlayColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ))),
                        child: Container(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.save_alt,
                                size: 21,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              width > 280
                                  ? Text(
                                      'Save Entry',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ))));
  }
}
