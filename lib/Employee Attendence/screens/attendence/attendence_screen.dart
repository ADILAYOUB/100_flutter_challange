import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterchallenge/Employee%20Attendence/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../services/database_service.dart';
import 'attendance_service.dart';

class EmpAttendanceScreen extends StatefulWidget {
  const EmpAttendanceScreen({super.key});

  @override
  State<EmpAttendanceScreen> createState() => _EmpAttendanceScreenState();
}

class _EmpAttendanceScreenState extends State<EmpAttendanceScreen> {
  @override
  void initState() {
    Provider.of<AttendanceService>(context, listen: false)
        .getEmpTodayAttendance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final attendanceService = Provider.of<AttendanceService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 32),
                child: const Text("Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ))),
            Consumer<DatabaseService>(builder: (context, dbService, child) {
              return FutureBuilder(
                  future: dbService.getUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      UserModel user = snapshot.data!;
                      return Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              user.name != '' ? user.name : user.employeeId,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              )));
                    }
                    return const SizedBox(
                        width: 60, child: LinearProgressIndicator());
                  });
            }),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 32),
                child: const Text("Todays Status",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ))),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 12, bottom: 32),
              height: 152,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.red,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        const Text("CheckIn",
                            style: TextStyle(color: Colors.red, fontSize: 24)),
                        const SizedBox(width: 80, child: Divider()),
                        Text(
                          attendanceService.attendanceModel?.checkIn ?? "--/--",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black45,
                          ),
                        ),
                      ])),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        const Text("CheckOut",
                            style: TextStyle(color: Colors.red, fontSize: 24)),
                        const SizedBox(width: 80, child: Divider()),
                        Text(
                          attendanceService.attendanceModel?.checkOut ??
                              "--/--",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black45,
                          ),
                        ),
                      ])),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(DateFormat("dd MMMM yyyy").format(DateTime.now()),
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
            ),
            StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      DateFormat("hh:mm:ss a").format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 24.0),
            ActionSlider.standard(
              sliderBehavior: SliderBehavior.stretch,
              width: 300.0,
              backgroundColor: Colors.white,
              toggleColor: Colors.red,
              action: (controller) async {
                controller.loading(); //starts loading animation
                await attendanceService.markAttendance(context);
                controller.success(); //starts success animation
                controller.reset(); //resets the slider
              },
              child: Text(
                  attendanceService.attendanceModel?.checkIn == null
                      ? 'Slide to CheckIn'
                      : 'Slide to CheckOut',
                  style: const TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
