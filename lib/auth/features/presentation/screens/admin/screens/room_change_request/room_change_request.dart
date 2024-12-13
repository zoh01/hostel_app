import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/room_change_request/widgets/room_change.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/room_change_request/widgets/room_change_container.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/room_available/widgets/room_container.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class RoomChangeRequest extends StatelessWidget {
  RoomChangeRequest({super.key});

  List<RoomChange> changeRequest = [
    RoomChange('Adebayo Wariz', 'warizoh', '201', 'B', 'adebayozoh@gmail.com',
        '07025136608', 'A', '103', 'Kitchen cabinet is leaking', () {}, () {}),
    RoomChange('Olamide Wariz', 'olamide', '203', 'B', 'adebayozoh@gmail.com',
        '07082390674', 'A', '102', 'Bathroom tap is not working', () {}, () {}),
    RoomChange('Warizoh Olamide', 'zoh', '101', 'A', 'warizoholamide@gmail.com',
        '08163133077', 'B', '203', 'Roof is leaking', () {}, () {}),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? ZohColors.darkerGrey : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: dark ? Colors.white : Colors.black,
          ),
        ),
        title: const Text(
          'Room Change Request',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: changeRequest.length,
          itemBuilder: _buildRoomChangeContainer,
      ),
    );
  }

  Widget _buildRoomChangeContainer(BuildContext context, int index) {
    RoomChange zoh = changeRequest[index];
    return RoomChangeContainer(
      name: zoh.name,
      userName: zoh.userName,
      currentRoom: zoh.currentRoom,
      currentBlock: zoh.currentBlock,
      email: zoh.email,
      phoneNo: zoh.phoneNo,
      block: zoh.block,
      room: zoh.room,
      reason: zoh.reason,
      reject: zoh.reject,
      approve: zoh.approve,
    );
  }
}
