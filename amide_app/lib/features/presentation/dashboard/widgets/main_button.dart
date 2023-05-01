import 'package:flutter/material.dart';

import '../../../../core/config/colors.dart';

class MainButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? navigation;

  const MainButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: navigation,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
            overlayColor:
                MaterialStateProperty.all(Color.fromARGB(255, 2, 5, 27)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ))),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
