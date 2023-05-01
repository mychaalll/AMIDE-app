import 'package:amide_app/features/data/provider/elderlyData.dart';
import 'package:amide_app/features/presentation/elderly/screens/edit_elderly_screen.dart';
import 'package:amide_app/features/presentation/elderly/screens/view_elderly_screen.dart';
import 'package:amide_app/core/config/colors.dart';
import 'package:amide_app/core/config/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../data/models/elderly.dart';


class ElderlyTile extends StatelessWidget {
  final int tileIndex;
  const ElderlyTile({
    Key? key,
    required this.tileIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ElderlyData>(
      builder: ((context, value, child) {
        Elderly currentElderly = value.getElderly(tileIndex);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Slidable(
            closeOnScroll: true,
            startActionPane: ActionPane(
              extentRatio: 0.3,
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  autoClose: true,
                  onPressed: (context) {
                    //go to edit
                    Log.d("Selected to edit");
                    Navigator.of(context).push(
                      PageTransition(
                        child: EditElderlyScreen(
                          currentElderly: currentElderly,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
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
                  onPressed: (context) {
                    Log.d("Deleting ${currentElderly.name}");
                    Provider.of<ElderlyData>(context, listen: false)
                        .deleteElderly(currentElderly.key);
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
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: ViewElderlyScreen(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                  Provider.of<ElderlyData>(context, listen: false)
                      .setActiveElderly(currentElderly.key);
                },
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
                            Icons.elderly_woman,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  currentElderly.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      color: Colors.white),
                                ),
                                Text(
                                  currentElderly.age + ' years old',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
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
