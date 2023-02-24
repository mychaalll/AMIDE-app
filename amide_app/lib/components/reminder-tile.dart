import 'package:amide_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class reminderTile extends StatefulWidget {
  const reminderTile({
    Key? key,
  }) : super(key: key);

  @override
  State<reminderTile> createState() => _reminderTileState();
}

class _reminderTileState extends State<reminderTile> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:5.0),
      child: Slidable(
        closeOnScroll: true,
        startActionPane: ActionPane(
          extentRatio: 0.3,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (context) {
                
              },
              backgroundColor: Colors.blue,
              icon: Icons.edit_note,
              label: 'Edit',
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            )
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.3,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (context){

              }, //delete function
              icon: Icons.delete_forever,
              label: 'Delete',
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_note,
                    color: value == true? Colors.white : Colors.grey[500],
                    size: 25,
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '08:00 AM',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: value == true? Colors.white : Colors.grey[500],
                          ),
                        ),
                        Text(
                          'Breakfast',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            color: value == true? Colors.white : Colors.grey[500],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Switch.adaptive(
                    activeColor: Colors.white,
                    activeTrackColor: Color.fromARGB(255, 20, 44, 223),
                    inactiveThumbColor: Colors.grey[500],
                    inactiveTrackColor: Color.fromARGB(255, 10, 23, 119),
                    value: value, 
                    onChanged: (value) => setState(() {
                      this.value = value;
                      print(value);
                    })
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}