import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/room_available/widgets/room_container.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/room_available/widgets/room_details.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/device/device_utilities.dart';

class RoomAvailable extends StatelessWidget {
  RoomAvailable({super.key});

  List<RoomDetails> roomDetails = [
    RoomDetails(ZohImageString.roomAvailable, '101', 'A', '5', '2', 'Deluxe', () {}),
    RoomDetails(ZohImageString.roomAvailable, '102', 'A', '5', '3', 'Luxury', () {},),
    RoomDetails(ZohImageString.roomAvailable, '103', 'A', '5', '1', 'AC', () {},),
    RoomDetails(ZohImageString.availableRoom, '201', 'B', '4', '0', 'Deluxe', () {},),
    RoomDetails(ZohImageString.availableRoom, '202', 'B', '4', '1', 'Luxury', () {},),
    RoomDetails(ZohImageString.availableRoom, '203', 'B', '4', '2', 'Luxury', () {},),
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
          'Available Rooms',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: roomDetails.length,
        itemBuilder: _buildAvailableRooms,
      ),
    );
  }

  Widget _buildAvailableRooms(BuildContext context, int index) {
    RoomDetails roomDetail = roomDetails[index];
    return RoomContainer(
      image: roomDetail.image,
      roomNo: roomDetail.roomNo,
      block: roomDetail.block,
      capacity: roomDetail.capacity,
      currentCapacity: roomDetail.currentCapacity,
      type: roomDetail.type,
      onTap: roomDetail.onTap,);
  }
}

