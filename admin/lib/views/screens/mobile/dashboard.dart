import 'package:flutter/material.dart';

class MobileDashboardScreen extends StatelessWidget {
const MobileDashboardScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Dashboard"),
      ),
    );
  }
}