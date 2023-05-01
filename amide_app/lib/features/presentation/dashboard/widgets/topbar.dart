import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  String name;

  Topbar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  color: Colors.black),
            ),
            SizedBox(height: 7),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  color: Colors.black),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              size: 23,
              color: Colors.black,
            )),
      ],
    );
  }
}
