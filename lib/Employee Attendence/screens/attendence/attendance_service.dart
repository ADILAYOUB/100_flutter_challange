import 'package:flutter/material.dart';
import '../../constants/constants.dart';
import '../../screens/attendence/attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../utils/snakebar.dart';

class AttendanceService extends ChangeNotifier {
  final SupabaseClient _supabase = Supabase.instance.client;
  AttendanceModel? attendanceModel;
  String todayDate = DateFormat("dd MMMM yyyy").format(DateTime.now());

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // get Employee today Attendance
  Future getEmpTodayAttendance() async {
    final List result = await _supabase
        .from(Constants.attendanceTable)
        .select()
        .eq('employee_id', _supabase.auth.currentUser!.id)
        .eq('date', todayDate);
    if (result.isNotEmpty) {
      attendanceModel = AttendanceModel.fromJson(result.first);
    }
    notifyListeners();
  }

  //Mark as present
  Future markAttendance(BuildContext context) async {
    // check if user has check in first if no then insert if yes then update the checkout
    if (attendanceModel?.checkIn == null) {
      await _supabase.from(Constants.attendanceTable).insert({
        'employee_id': _supabase.auth.currentUser!.id,
        'date': todayDate,
        'check_in': DateFormat("HH:mm").format(DateTime.now())
      });
    } else if (attendanceModel?.checkOut == null) {
      await _supabase
          .from(Constants.attendanceTable)
          .update({'check_out': DateFormat("HH:mm").format(DateTime.now())})
          .eq('employee_id', _supabase.auth.currentUser!.id)
          .eq('date', todayDate);
    } else {
      Common.showSnackBar('You have already CheckOut !', context);
    }
    getEmpTodayAttendance();
  }
}
