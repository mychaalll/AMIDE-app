import 'package:admin/core/theme/color.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool hiddenPass = false;

  void toggleHiddenPass() {
    setState(() {
      hiddenPass = !hiddenPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !hiddenPass,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: () => toggleHiddenPass(),
          child: Icon(
            Icons.remove_red_eye,
            color: hiddenPass ? CustomColor.primBlue : Colors.grey,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please input fields";
        }
        return null;
      },
    );
  }
}
