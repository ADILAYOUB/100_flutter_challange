import 'package:flutter/material.dart';
import 'package:flutterchallenge/Employee%20Attendence/services/location_services.dart';
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

  // create the date month picket
  String _attendanceHistoryMonth =
      DateFormat("MMMM yyyy").format(DateTime.now());

  String get attendanceHistoryMonth => _attendanceHistoryMonth;

  set attendanceHistoryMonth(String value) {
    _attendanceHistoryMonth = value;
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
    //Map the location
    Map? getlocation = await LocationService().getLocation(context);
    if (getlocation != null) {
      // check if user has check in first if no then insert if yes then update the checkout
      if (attendanceModel?.checkIn == null) {
        await _supabase.from(Constants.attendanceTable).insert({
          'employee_id': _supabase.auth.currentUser!.id,
          'date': todayDate,
          'check_in': DateFormat("HH:mm").format(DateTime.now()),
          'check_in_location': getlocation,
        });
      } else if (attendanceModel?.checkOut == null) {
        await _supabase
            .from(Constants.attendanceTable)
            .update({
              'check_out': DateFormat("HH:mm").format(DateTime.now()),
              'check_out_location': getlocation
            })
            .eq('employee_id', _supabase.auth.currentUser!.id)
            .eq('date', todayDate);
      } else {
        Common.showSnackBar(
            'You have already CheckOut !', color: Colors.green, context);
      }
      getEmpTodayAttendance();
    } else {
      Common.showSnackBar(
          'Not able to get Your Location ', color: Colors.red, context);
      getEmpTodayAttendance();
    }
  }

  // get attendance based on date time
  Future<List<AttendanceModel>> getAttendanceHistory() async {
    final List data = await _supabase
        .from(Constants.attendanceTable)
        .select()
        .eq('employee_id', _supabase.auth.currentUser!.id)
        .textSearch('date', "'$attendanceHistoryMonth'", config: 'english')
        .order('created_at', ascending: false);
    return data.map((e) => AttendanceModel.fromJson(e)).toList();
  }
}
