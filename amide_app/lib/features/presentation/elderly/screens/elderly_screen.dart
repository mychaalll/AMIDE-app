import 'package:amide_app/widgets/drawer.dart';
import 'package:amide_app/features/presentation/elderly/widgets/elderly_tile.dart';
import 'package:amide_app/features/data/provider/elderlyData.dart';
import 'package:amide_app/features/presentation/elderly/screens/create_elderly_screen.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ElderlyScreen extends StatefulWidget {
  const ElderlyScreen({super.key});

  @override
  State<ElderlyScreen> createState() => _ElderlyScreenState();
}

class _ElderlyScreenState extends State<ElderlyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ElderlyData>(context, listen: false).getElderlys();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: AppColors.primBlue,
          centerTitle: true,
          title: Text(
            'Elderly',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Montserrat',
                color: Colors.white),
          )),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primBlue,
        foregroundColor: Colors.white,
        label: Text('Add Elderly'),
        icon: Icon(Icons.person_add_alt_1_rounded),
        onPressed: () {
          Navigator.of(context).push(
            PageTransition(
              child: CreateElderlyScreen(),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                'Elderly List',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Provider.of<ElderlyData>(context).elderlyCount == 0
                    ? Container(
                        width: width,
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
                    : ListView.builder(
                        itemCount:
                            Provider.of<ElderlyData>(context).elderlyCount,
                        itemBuilder: ((context, index) {
                          return ElderlyTile(
                            tileIndex: index,
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
