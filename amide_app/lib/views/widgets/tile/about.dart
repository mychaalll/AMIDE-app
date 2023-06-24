import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
const AboutCard({
  Key? key,
  required this.name,
  required this.subtitle,
  required this.image,
 }) : super(key: key);

 final String name;
 final String subtitle;
 final String image;

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Container(
          height: 300,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            ),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 4,
                offset: const Offset(0, 4),
              )
            ],
          ),
        ),
        const SizedBox(width: 10),
         SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),  
              ),
              const SizedBox(height: 5.0),
              Text(subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primBlue,
                ),  
              ),
            ],
          ),
        ),
      ],
    );
  }
}