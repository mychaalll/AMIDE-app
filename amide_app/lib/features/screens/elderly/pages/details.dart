import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class ElderlyDetails extends StatelessWidget {
  final String description;
  const ElderlyDetails({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                readOnly: true,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.bottom,
                maxLines: 40,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 5.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: description,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}