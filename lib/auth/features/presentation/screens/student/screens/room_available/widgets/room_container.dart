import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/change_room/change_room.dart';
import 'package:hostel_app/models/room_availability_model.dart';
import 'package:hostel_app/utils/constants/image_string.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/constants/text_string.dart';
import '../../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../../utils/helpers/helper_functions.dart';

class RoomContainer extends StatelessWidget {
  final Result room;
  final void Function()? onTap;

  const RoomContainer({
    required this.room,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: ZohSizes.md, vertical: ZohSizes.md),
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: ZohColors.primaryColor, width: 3),
          ),
          color: dark ? Colors.black26 : Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image(
                      image: const AssetImage(ZohImageString.roomAvailable),
                      width: ZohDeviceUtils.getScreenWidth(context) * .2),
                  const SizedBox(
                    width: ZohSizes.spaceBtwZoh,
                  ),
                  Expanded(
                    child: Text(
                      'Room No - ${room.roomNumber}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'IBM_Plex_Sans',
                          fontSize: ZohSizes.spaceBtwZoh,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: ZohSizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Block ${room.blockId.block}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Capacity: ${room.roomCapacity}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Current Capacity: ${room.roomCurrentCapacity}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Type: ${room.roomType?.roomType ?? " : Sharing"}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: ZohSizes.spaceBtwZoh,
              ),
              room.roomCurrentCapacity == 5
                  ? SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 20),
                          minimumSize: const Size(0, 30),
                          side: const BorderSide(color: Colors.red),
                          elevation: 5,
                        ),
                        child: const Text(
                          ZohTextString.unAvailable,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IBMPlexSans',
                              fontSize: 15),
                        ),
                      ),
                    )
                  : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const ChangeRoom(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          textStyle: const TextStyle(fontSize: 20),
                          minimumSize: const Size(0, 30),
                          side: const BorderSide(color: Colors.green),
                          elevation: 5,
                        ),
                        child: const Text(
                          ZohTextString.available,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IBMPlexSans',
                              fontSize: 15),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
