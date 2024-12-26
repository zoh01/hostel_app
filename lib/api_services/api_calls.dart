import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/api_services/api_provider.dart';
import 'package:hostel_app/api_services/api_utils.dart';
import 'package:hostel_app/auth/features/presentation/screens/home/screens/home_screen.dart';
import 'package:hostel_app/auth/features/presentation/screens/login_screen/login_screen.dart';
import 'package:hostel_app/models/user_response.dart';
import 'package:provider/provider.dart';

class ApiCall {
  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final Map<String, dynamic> requestData = {
      "emailId":email,
      "password":password
    };
    final response = await apiProvider.postResponse(
      ApiUtils.login,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['status'] == "FAILED") {
        // Ignore: use_build_context_synchronously
        ApiUtils.showErrorSnackBar(context, responseBody['error']);
      }
      final UserResponse userResponse = UserResponse.fromJson(responseBody);
      print("user email : ${userResponse.result[0].emailId}");

      ApiUtils.email = userResponse.result[0].emailId;
      ApiUtils.phoneNumber = userResponse.result[0].phoneNumber.toString();
      ApiUtils.roomNumber = userResponse.result[0].roomNumber.toString();
      ApiUtils.userName = userResponse.result[0].userName;
      ApiUtils.blockNumber = userResponse.result[0].block.toString();
      ApiUtils.firstName = userResponse.result[0].firstName.toString();
      ApiUtils.lastName = userResponse.result[0].lastName.toString();
      ApiUtils.roleId = userResponse.result[0].roleId.roleId;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      final Map<String, dynamic> errorResponse = json.decode(response.body);
      ApiUtils.showErrorSnackBar(
        context,
        errorResponse['msg'],
      );
    }
  }

  Future<String?> registerStudent(
    BuildContext context,
    String userName,
    String firstName,
    String lastName,
    String phoneNumber,
    String block,
    String roomNumber,
    String email,
    String password,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "userName": userName,
      "emailId": email,
      "password": password,
      "roleId": 2,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "roomNumber": roomNumber,
      "blockNumber": block,
    };

    final response = await apiProvider.postResponse(
      ApiUtils.register,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );

    if (response.statusCode == 202) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['status'] == "Student created successfully") {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
      if (responseBody['status'] == "202") {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        if (responseBody['status'] == "Student Already Exists") {
          ApiUtils.showErrorSnackBar(context, responseBody['status']);
        }
      }
    }
    return null;
  }

  Future<String?> createStaff(
    BuildContext context,
    String userName,
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
    String jobRole,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "userName": userName,
      "emailId": email,
      "password": password,
      "roleId": 3,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "jobRole": jobRole,
    };

    final response = await apiProvider.postResponse(
      ApiUtils.createStaff,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }

  Future<String?> createAnIssue(
    BuildContext context,
    String roomNumber,
    String blockNumber,
    String issue,
    String studentComment,
    String studentEmailId,
    String phoneNumber,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "roomNumber": roomNumber,
      "block": blockNumber,
      "issue": issue,
      "studentComment": studentComment,
      "studentEmailId": studentEmailId,
    };

    final response = await apiProvider.postResponse(
      ApiUtils.createIssue,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }

  Future<String?> roomChangeRequestZoh(
    BuildContext context,
    String changeRoomNumber,
    String changeBlockNumber,
    String reason,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestData = {
      "currentRoomNumber": ApiUtils.roomNumber,
      "toChangeRoomNumber": changeRoomNumber,
      "currentBlock": ApiUtils.blockNumber,
      "toChangeBlock": changeBlockNumber,
      "studentEmailId": ApiUtils.email,
      "changeReason": reason,
    };

    final response = await apiProvider.postResponse(
      ApiUtils.zohRoomChangeRequest,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestData,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }

  void deleteStaff(
    BuildContext context,
    String emailId,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    final response = await apiProvider.deleteResponse(
      '${ApiUtils.deleteStaff}$emailId',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
  }

  Future<String?> approveOrReject(
    BuildContext context,
    String adminComment,
    String action,
    int requestId,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestzoh = {
      "roomChangeRequestId": requestId,
      "approveOrReject": action,
      "adminComment": adminComment,
    };
    final response = await apiProvider.postResponse(
      ApiUtils.acceptOrReject,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestzoh,
    );
    if (response.statusCode == 202) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }

  Future<String?> closeAnIssue(
    BuildContext context,
    String staffComment,
    String issueId,
  ) async {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);

    final Map<String, dynamic> requestOmolara = {
      "issueId": issueId,
      "staffComment": staffComment,
    };
    final response = await apiProvider.postResponse(
      ApiUtils.closeAnIssue,
      headers: {
        'Content-Type': 'application/json',
      },
      body: requestOmolara,
    );
    if (response.statusCode == 202) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      if (responseBody['statusCode'] == 200) {
        ApiUtils.showSuccessSnackBar(context, responseBody['status']);
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    }
    return null;
  }
}
