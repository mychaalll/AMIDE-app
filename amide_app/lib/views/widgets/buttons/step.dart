import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class StepButton extends StatelessWidget {
  const StepButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.isEnabled = true,
  }) : super(key: key);

  final Function()? onPressed;
  final String title;
  final Color? backgroundColor;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(isEnabled ? backgroundColor ?? AppColors.primBlue : Colors.grey),
        overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 2, 5, 27)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
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
