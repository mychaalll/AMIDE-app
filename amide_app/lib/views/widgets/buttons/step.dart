import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const StepButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.primBlue),
          overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 2, 5, 27)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ))),
      child: SizedBox(
        width: 80,
        height: 30,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              fontFamily: 'Montserrat',
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
