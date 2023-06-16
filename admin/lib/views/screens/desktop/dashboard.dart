import 'package:admin/core/strings/dimen.dart';
import 'package:admin/core/theme/color.dart';
import 'package:admin/models/elderly.dart';
import 'package:admin/services/dashboard.dart';
import 'package:admin/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesktopDashboardScreen extends StatefulWidget {
  const DesktopDashboardScreen({Key? key}) : super(key: key);

  @override
  State<DesktopDashboardScreen> createState() => _DesktopDashboardScreenState();
}

class _DesktopDashboardScreenState extends State<DesktopDashboardScreen> {
  late Stream<List<Elderly>> getElderly;

  @override
  void initState() {
    getElderly = DatabaseServices().getElderly();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DashboardServices dashboard = Provider.of<DashboardServices>(context);

    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(Dimen.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Amide Record",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: Dimen.defaultPadding),
            StreamBuilder<List<Elderly>>(
              stream: getElderly,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  final elderly = dashboard.isAscending ? snapshot.data! : snapshot.data!.reversed;
                  if (snapshot.hasData) {
                    return Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: DataTable(
                        border: TableBorder(
                          verticalInside: BorderSide(
                            color: CustomColor.borderColor,
                          ),
                        ),
                        columns: [
                          ...dashboard.dashboardHeaderList.map((String value) {
                            return DataColumn(
                              onSort: (index, value) {
                                dashboard.toggleIsAscending();
                              },
                              label: SizedBox(
                                child: Row(
                                  children: [
                                    Text(value),
                                    SizedBox(width: Dimen.defaultPadding),
                                    Icon(
                                      dashboard.isAscending ? CupertinoIcons.sort_up : CupertinoIcons.sort_down,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          const DataColumn(
                            label: SizedBox(),
                          ),
                        ],
                        rows: elderly.map((Elderly elderly) {
                          final List<String> user = [
                            elderly.id,
                            elderly.name,
                            elderly.sex,
                            elderly.age.toString(),
                            elderly.bloodType,
                          ];

                          return DataRow(
                            selected: false,
                            onSelectChanged: (value) {},
                            cells: [
                              ...user.map((String user) {
                                return DataCell(
                                  onTap: () {
                                    if (elderly.id == user) {
                                      dashboard.toggleIsAscending();
                                    }
                                  },
                                  Text(
                                    user,
                                    style: TextStyle(
                                      color: elderly.id == user ? CustomColor.primBlue : null,
                                      decoration: elderly.id == user ? TextDecoration.underline : null,
                                    ),
                                  ),
                                );
                              }).toList(),
                              DataCell(
                                onTap: () async {
                                  await DatabaseServices().deleteData(elderly.id);
                                },
                                const Icon(
                                  CupertinoIcons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    );
                  }
                }
                return Text('State: ${snapshot.connectionState}');
              },
            )
          ],
        ),
      ),
    );
  }
}
