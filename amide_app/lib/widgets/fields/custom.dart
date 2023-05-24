import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.maxLines = 1,
    this.isRequired = true,
    this.isCustomValidator = false,
    this.keyboardType = TextInputType.name,
    this.initialValue = "",
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hintText;
  final int maxLines;
  final bool isRequired;
  final bool isCustomValidator;
  final TextInputType keyboardType;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          validator: (String? value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return "This field is required";
            } else if (isCustomValidator) {}
            return null;
          },
        ),
      ],
    );
  }
}
