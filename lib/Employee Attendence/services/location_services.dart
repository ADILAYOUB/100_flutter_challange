import 'package:flutterchallenge/Employee%20Attendence/utils/snakebar.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationService {
  Location location = Location();
  late LocationData _localData;

  Future<Map<String, double?>?> getLocation(BuildContext context) async {
    bool isServiceEnable;
    PermissionStatus permissionStatus;

    // check for location is enabled
    isServiceEnable = await location.serviceEnabled();
    if (!isServiceEnable) isServiceEnable = await location.requestService();
    if (!isServiceEnable) {
      Common.showSnackBar('Please Enable Location Services', context);
      return null;
    }

    // get location permission
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }

    if (permissionStatus != PermissionStatus.granted) {
      Common.showSnackBar('Please Allow Location Access', context);
      return null;
    }

    // all permission granted
    _localData = await location.getLocation();
    return {
      'latitude': _localData.latitude,
      'longitude': _localData.longitude,
    };
  }
}
