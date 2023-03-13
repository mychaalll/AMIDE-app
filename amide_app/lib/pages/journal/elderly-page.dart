import 'package:amide_app/components/drawer.dart';
import 'package:amide_app/components/elderly-tile.dart';
import 'package:amide_app/provider/elderlyData.dart';
import 'package:amide_app/pages/create/create-elderly-page.dart';
import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ElderlyPage extends StatefulWidget {
  const ElderlyPage({super.key});

  @override
  State<ElderlyPage> createState() => _ElderlyPageState();
}

class _ElderlyPageState extends State<ElderlyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ElderlyData>(context, listen: false).getElderlys();
  }

  @override
  Widget build(BuildContext context) {
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
              child: CreateElderly(),
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
                child: ListView.builder(
                    itemCount: Provider.of<ElderlyData>(context).elderlyCount,
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
