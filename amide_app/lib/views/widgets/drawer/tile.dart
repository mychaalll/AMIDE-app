import 'package:amide_app/core/config/colors.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function()? navigation;
  const DrawerTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.navigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
          selectedColor: AppColors.primBlue,
          selectedTileColor: AppColors.primBlue.withOpacity(0.1),
          leading: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          minLeadingWidth: 40,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: navigation),
    );
  }
}
