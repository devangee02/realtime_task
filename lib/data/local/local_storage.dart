import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../models/employee_model.dart';

class LocalStorage {
  static Future<void> saveList(
      List<EmployeeModel> employeeList, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> employeeMapList = employeeList
        .map((employee) => {
              'employeeName': employee.employeeName,
              'job': employee.job,
              'startDate': employee.startDate,
              'endDate': employee.endDate,
            })
        .toList();

    String jsonString = jsonEncode(employeeMapList);
    await prefs.setString(key, jsonString);
  }

  static Future<List<EmployeeModel>> getList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? jsonString = prefs.getString(key);

    try {
      if (jsonString != null) {
        List<dynamic> employeeMapList = jsonDecode(jsonString);

        List<EmployeeModel> employeeList = employeeMapList
            .map((employeeMap) => EmployeeModel(
                  employeeName: employeeMap['employeeName'],
                  job: employeeMap['job'],
                  startDate: employeeMap['startDate'],
                  endDate: employeeMap['endDate'],
                ))
            .toList();

        return employeeList;
      }
    } catch (e) {
      print('Error decoding JSON: $e');
    }

    return [];
  }
}
