import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/core/config/utils.dart';
import 'package:amide_app/features/data/models/elderly/elderly.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/features/data/services/firestore.dart';
import 'package:amide_app/widgets/buttons/custom.dart';
import 'package:amide_app/widgets/fields/custom.dart';
import 'package:amide_app/widgets/drop_down/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class EditElderlyScreen extends StatefulWidget {
  const EditElderlyScreen({
    super.key,
    required this.elderly,
  });

  final Elderly elderly;

  @override
  State<EditElderlyScreen> createState() => _EditElderlyScreenState();
}

class _EditElderlyScreenState extends State<EditElderlyScreen> {
  late String newName;
  late int newAge;
  late double newHeight;
  late double newWeight;
  late bool newActive;
  late String newDescription;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    final ElderlyData elderlyData = Provider.of<ElderlyData>(context, listen: false);
    _nameController.text = widget.elderly.name;
    newName = widget.elderly.name;

    _ageController.text = widget.elderly.age.toString();
    newAge = widget.elderly.age;

    _heightController.text = (widget.elderly.height).toString();
    newHeight = widget.elderly.height;

    _weightController.text = (widget.elderly.weight).toString();
    newWeight = widget.elderly.weight;

    _descriptionController.text = widget.elderly.description ?? "";
    newDescription = widget.elderly.description ?? "";

    elderlyData.bloodType = widget.elderly.bloodType;
    elderlyData.sex = widget.elderly.sex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ElderlyData elderlyData = Provider.of<ElderlyData>(context);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.popRoute();
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
          child: Form(
            key: formKey,
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
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    //blood type
                    Expanded(
                      child: CustomDropDown(
                        item: elderlyData.bloodTypes,
                        label: "Blood Type",
                        value: elderlyData.bloodType,
                        onChanged: (value) {
                          elderlyData.updateBloodType(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    //sex
                    Expanded(
                      child: CustomDropDown(
                        item: elderlyData.sexList,
                        label: "Sex",
                        value: elderlyData.sex,
                        onChanged: (value) {
                          elderlyData.updateSex(value!);
                        },
                      ),
                    ),
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
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await DatabaseServices(uid: widget.elderly.uid).updateElderly(
                        data: Elderly(
                          name: _nameController.text,
                          age: int.parse(_ageController.value.text),
                          sex: elderlyData.sex ?? elderlyData.sexList[0],
                          bloodType: elderlyData.bloodType ?? elderlyData.bloodType![0],
                          height: double.parse(_heightController.value.text),
                          weight: double.parse(_weightController.value.text),
                        ),
                      );
                      context.popRoute();
                      Log.d("Updated ${widget.elderly.uid}");
                    }
                  },
                  label: "Save Entry",
                  icon: Icons.save,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
