import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ElderlyDetails extends StatelessWidget {
  final String description;
  const ElderlyDetails({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.bgColor,
      child: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            child: Container(
              width: width - 30,
              child: TextField(
                readOnly: true,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.bottom,
                maxLines: 40,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 5.0,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: description,
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}