import 'package:flutter/material.dart';

class ApiUtils {
  static const String baseUrl = "https://unt-house-management.onrender.com/unt";

  static const String login = "/student/login";
  static const String register = "/student/saveStudent";
  static const String createStaff = "/admin/create/staff";
  static const String createIssue = "/maintenance/createIssue";
  static const String zohRoomChangeRequest = "/room/change/request";
  static const String roomAvailability = "/room/getRooms/AVAILABLE";
  static const String studentIssues = "/maintenance/fetch/issue/open";
  static const String allStaff = "/admin/fetch/allStaff";
  static const String deleteStaff = "/admin/delete/staff/";
  static const String studentInfo = "/student/getStudentDetails?studentEmailId=";
  static const String roomChangeRequest = "/room/fetch/roomChange/requests";
  static const String acceptOrReject = "/admin/approveOrReject";
  static const String closeAnIssue = "/maintenance/close/issue";

  /// User Info
  static String email = "";
  static String roomNumber = "";
  static String blockNumber = "";
  static String userName = "";
  static String firstName = "";
  static String lastName = "";
  static String phoneNumber = "";
  static int? roleId;

  /// SnackBar
  static void showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }
}
