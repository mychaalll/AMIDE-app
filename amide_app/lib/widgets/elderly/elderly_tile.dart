import 'package:amide_app/core/routes/routes.gr.dart';
import 'package:amide_app/features/data/provider/elderly.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/core/config/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ElderlyTile extends StatelessWidget {
  // final int tileIndex;

  const ElderlyTile({
    Key? key,
    required this.name,
    required this.age,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final int age;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<ElderlyData>(
      builder: ((context, value, child) {
        // Elderly currentElderly = value.getElderly(tileIndex);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Slidable(
            closeOnScroll: true,
            startActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  autoClose: true,
                  onPressed: (context) {
                    //go to edit
                    Log.d("Selected to edit");
                    context.pushRoute(
                      const EditElderlyRoute(),
                    );
                  },
                  backgroundColor: Colors.blue,
                  icon: Icons.edit_note,
                  label: 'Edit',
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                )
              ],
            ),
            endActionPane: ActionPane(
              extentRatio: 0.3,
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    // Log.d("Deleting ${currentElderly.name}");
                    // Provider.of<ElderlyData>(context, listen: false).deleteElderly(currentElderly.key);
                  }, //delete function
                  icon: Icons.delete_forever,
                  label: 'Delete',
                  backgroundColor: Colors.red,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      const Icon(
                        Icons.elderly_woman,
                        color: Colors.white,
                        size: 25,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              name,
                              // currentElderly.name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white),
                            ),
                            Text(
                              "$age years old",
                              // '${currentElderly.age} years old',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
