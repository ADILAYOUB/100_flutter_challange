import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simple_month_year_picker/simple_month_year_picker.dart';

import '../attendence/attendance_model.dart';
import '../attendence/attendance_service.dart';

class EmpCalenderScreen extends StatefulWidget {
  const EmpCalenderScreen({super.key});

  @override
  State<EmpCalenderScreen> createState() => _EmpCalenderScreenState();
}

class _EmpCalenderScreenState extends State<EmpCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    final attendanceService = Provider.of<AttendanceService>(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 20, top: 60, bottom: 12),
          child: const Text("My Attendance",
              style: TextStyle(color: Colors.white, fontSize: 32)),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            attendanceService.attendanceHistoryMonth,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          OutlinedButton(
              onPressed: () async {
                final selectedMonth =
                    await SimpleMonthYearPicker.showMonthYearPickerDialog(
                        context: context,
                        disableFuture: true,
                        selectionColor: Colors.red);
                String pickMonth =
                    DateFormat('MMMM yyyy').format(selectedMonth);
                attendanceService.attendanceHistoryMonth = pickMonth;
              },
              child: const Text('Pick A Month')),
        ]),
        Expanded(
            child: FutureBuilder(
                future: attendanceService.getAttendanceHistory(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.length > 0) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            AttendanceModel attencdeData = snapshot.data[index];
                            return Container(
                              height: 160,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.red,
                                        blurRadius: 10,
                                        offset: Offset(2, 2))
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Center(
                                        child: Text(
                                          DateFormat('EE \n dd')
                                              .format(attencdeData.createdAt),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text("Check In",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          child: Divider(),
                                        ),
                                        Text(
                                          attencdeData.checkIn,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text("Check Out",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                            )),
                                        const SizedBox(
                                          width: 80,
                                          child: Divider(),
                                        ),
                                        Text(
                                          attencdeData.checkOut?.toString() ??
                                              '--/--',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                 const SizedBox(width: 16),
                                ],
                              ),
                            );
                          });
                    } else {
                      return const Center(
                          child: Text(
                        'No Data Availabe',
                      ));
                    }
                  }
                  return const LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.red,
                  );
                }))
      ],
    );
  }
}
