import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/widgets/buttons/custom.dart';
import 'package:amide_app/widgets/fields/custom.dart';
import 'package:amide_app/widgets/drop_down/custom.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class CreateElderlyScreen extends StatefulWidget {
  const CreateElderlyScreen({super.key});

  @override
  State<CreateElderlyScreen> createState() => _CreateElderlyScreenState();
}

@RoutePage()
class _CreateElderlyScreenState extends State<CreateElderlyScreen> {
  final List<String> bloodList = [
    "A+",
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  late String blood = bloodList[0];

  late String name;
  late String age;
  late String description;
  late double height;
  late double weight;

  final TextEditingController _descriptionController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ElderlyData elderlyData = Provider.of<ElderlyData>(context);

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            elderlyData.clearText();
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
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Add Entry',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          controller: elderlyData.nameController,
                          label: "Elderly Name",
                          hintText: "Enter Name",
                        ),
                        const SizedBox(height: 22),
                        CustomTextField(
                          controller: elderlyData.ageController,
                          label: "Age",
                          hintText: "Enter Age",
                          keyboardType: TextInputType.number,
                        ),
                        //age

                        const SizedBox(height: 22),
                        Row(
                          children: [
                            //blood type
                            Expanded(
                              child: CustomDropDown(
                                item: elderlyData.bloodTypes,
                                label: "Blood Type",
                                value: null,
                                onChanged: (value) {
                                  elderlyData.updateBloodType(value!);
                                },
                              ),
                            ),
                            const SizedBox(width: 32),
                            //sex
                            Expanded(
                              child: CustomDropDown(
                                item: elderlyData.sexList,
                                label: "Sex",
                                value: null,
                                onChanged: (value) {
                                  elderlyData.updateSex(value!);
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 22),
                        Row(
                          children: [
                            //height
                            Expanded(
                              child: CustomTextField(
                                controller: elderlyData.heightController,
                                label: "Height",
                                hintText: "Height in cm",
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 32),
                            //weight
                            Expanded(
                              child: CustomTextField(
                                controller: elderlyData.weightController,
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
                        const SizedBox(height: 22),
                        //button
                        CustomButton(
                          label: "Save Entry",
                          icon: Icons.save_alt,
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              elderlyData.createData();
                              context.popRoute();
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}