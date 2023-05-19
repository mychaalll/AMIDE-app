import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/widgets/buttons/custom.dart';
import 'package:amide_app/widgets/fields/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditElderlyScreen extends StatefulWidget {
  // final Elderly currentElderly;
  const EditElderlyScreen({
    super.key,
    // required this.currentElderly,
  });

  @override
  State<EditElderlyScreen> createState() => _EditElderlyScreenState();
}

List<String> sexList = <String>['Male', 'Female'];
List<String> bloodList = <String>['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

class _EditElderlyScreenState extends State<EditElderlyScreen> {
  late String newName;
  late String newSex;
  late String newAge;
  late double newHeight;
  late double newWeight;
  late String newBloodType;
  late bool newActive;
  late String newDescription;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  String sex = sexList.first;
  String blood = bloodList.first;

  @override
  void initState() {
    // final ElderlyData elderlyData = Provider.of<ElderlyData>(context);
    // final doc = FireStoreServices().fetchElderly(
    //   id:
    // );
    // _nameController.text = widget.currentElderly.name;
    // newName = widget.currentElderly.name;

    // _ageController.text = widget.currentElderly.age.toString();
    // newAge = widget.currentElderly.name;

    // _heightController.text = (widget.currentElderly.height).toString();
    // newHeight = widget.currentElderly.height;

    // _weightController.text = (widget.currentElderly.weight).toString();
    // newWeight = widget.currentElderly.weight;

    // _descriptionController.text = widget.currentElderly.description!;
    // newDescription = widget.currentElderly.description!;

    // newSex = widget.currentElderly.sex;
    // newBloodType = widget.currentElderly.bloodType;
    super.initState();
  }

  void _editElderly() {
    // Provider.of<ElderlyData>(context, listen: false).editElderly(
    //   elderly: Elderly(
    //     name: newName,
    //     age: int.parse(newAge),
    //     sex: newSex,
    //     description: newDescription,
    //     bloodType: blood,
    //     height: newHeight,
    //     weight: newWeight,
    //   ),
    //   elderlyKey: widget.currentElderly.key,
    // );
    context.popRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Edit Entry',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
              CustomTextField(
                controller: _nameController,
                label: "Elderly Name",
                hintText: "Enter Name",
              ),

              const SizedBox(height: 22),
              //age
              CustomTextField(
                controller: _ageController,
                label: "Age",
                hintText: "Enter Age",
              ),
              const SizedBox(height: 22),
              const Row(
                children: [
                  //blood type
                  // Expanded(
                  //   child: CustomDropDown(
                  //     item: elderlyData.bloodTypes,
                  //     label: "Blood Type",
                  //     value: elderlyData.bloodType ?? elderlyData.bloodTypes[0],
                  //     onChanged: (String? newValue) {
                  //       elderlyData.updateBloodType(newValue!);
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(width: 32),
                  // //sex
                  // Expanded(
                  //   child: CustomDropDown(
                  //     item: elderlyData.sexList,
                  //     label: "Sex",
                  //     value: elderlyData.sex ?? elderlyData.sexList[0],
                  //     onChanged: (String? value) {
                  //       elderlyData.updateSex(value!);
                  //     },
                  //   ),
                  // ),
                  SizedBox(width: 32),
                  //sex
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  //height

                  //weight
                  Expanded(
                    child: CustomTextField(
                      controller: _heightController,
                      label: "Height",
                      hintText: "Height in cm",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 32),
                  //weight
                  Expanded(
                    child: CustomTextField(
                      controller: _weightController,
                      label: "Weight",
                      hintText: "Weight in kg",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              //note
              CustomTextField(
                controller: _descriptionController,
                label: "Journal Details",
                hintText: "Some important notes here...",
                maxLines: 5,
                isRequired: false,
              ),
              const Spacer(),

              //button
              CustomButton(
                onPressed: () {},
                label: "Save Entry",
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
