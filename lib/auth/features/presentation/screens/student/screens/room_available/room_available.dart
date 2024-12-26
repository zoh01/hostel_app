import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_provider.dart';
import 'package:hostel_app/api_services/api_utils.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/room_available/widgets/room_container.dart';
import 'package:hostel_app/models/room_availability_model.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class RoomAvailable extends StatefulWidget {
  const RoomAvailable({super.key});

  @override
  State<RoomAvailable> createState() => _RoomAvailableState();
}

class _RoomAvailableState extends State<RoomAvailable> {
  RoomAvailability? roomAvailabilityModel;

  Future<void> fetchRoomAvailability() async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);

      final roomAvailability =
          await apiProvider.getResponse(ApiUtils.roomAvailability);

      if (roomAvailability.statusCode == 200) {
        final Map<String, dynamic> room = json.decode(roomAvailability.body);

        roomAvailabilityModel = RoomAvailability.fromJson(room);
      }
    } catch (e) {
      print('error $e');
    }
  }

  //
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
      body: FutureBuilder(
        future: fetchRoomAvailability(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return roomAvailabilityModel == null
                ? const Center(
                    child: Text('No room available'),
                  )
                : ListView.builder(
              shrinkWrap: true,
                itemCount: roomAvailabilityModel!.result.length,
                itemBuilder: (context, index) {
                    return RoomContainer(
                      room: roomAvailabilityModel!.result[index],
                    );
                  });
          }
        },
      ),
    );
  }
}
