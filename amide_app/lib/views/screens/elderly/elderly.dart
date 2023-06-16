import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/services/database.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/views/widgets/drawer.dart';
import 'package:amide_app/views/widgets/elderly/tile.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ElderlyScreen extends StatelessWidget {
  const ElderlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primBlue,
        centerTitle: true,
        title: const Text(
          'Elderly',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primBlue,
        foregroundColor: Colors.white,
        label: const Text('Add Elderly'),
        icon: const Icon(Icons.person_add_alt_1_rounded),
        onPressed: () => context.pushRoute(
          const CreateElderlyRoute(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Elderly List',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              StreamBuilder(
                stream: DatabaseServices().elders,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final documents = snapshot.data;
                    return documents!.isEmpty
                        ? const Center(
                            child: Column(
                              children: [
                                SizedBox(height: 60),
                                Icon(
                                  Icons.cancel_sharp,
                                  size: 100,
                                ),
                                Text(
                                  'No Elderlies',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: documents.length,
                              itemBuilder: (context, index) {
                                return ElderlyTile(
                                  elderly: documents[index],
                                );
                              },
                            ),
                          );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
