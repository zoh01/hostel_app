import 'package:flutter/material.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/image_string.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/constants/text_string.dart';
import '../../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../../utils/helpers/helper_functions.dart';

class RoomChangeContainer extends StatelessWidget {
  final String name;
  final String userName;
  final String currentRoom;
  final String currentBlock;
  final String email;
  final String phoneNo;
  final String block;
  final String room;
  final String reason;
  final void Function()? reject;
  final void Function()? approve;

  const RoomChangeContainer({
    super.key,
    required this.name,
    required this.userName,
    required this.currentRoom,
    required this.currentBlock,
    required this.email,
    required this.phoneNo,
    required this.block,
    required this.room,
    required this.reason,
    required this.reject,
    required this.approve,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(ZohSizes.md),
      child: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
              colors: [
                dark
                    ? ZohColors.secondaryColor.withOpacity(0.6)
                    : ZohColors.secondaryColor.withOpacity(0.5),
                dark
                    ? ZohColors.primaryColor.withOpacity(0.6)
                    : ZohColors.primaryColor.withOpacity(0.5),
              ]),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(ZohSizes.defaultSpace))),
        ),
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image(
                    image: const AssetImage(
                      ZohImageString.user,
                    ),
                    width: ZohDeviceUtils.getScreenWidth(context) * .2,
                  ),
                  const SizedBox(
                    width: ZohSizes.spaceBtwZoh,
                  ),
                  Expanded(
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontFamily: 'IBM_Plex_Sans',
                          fontSize: ZohSizes.spaceBtwZoh,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: ZohSizes.sm,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: $userName',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Current Room: $currentRoom',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Current Block: $currentBlock',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Email ID: $email',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Phone No: $phoneNo',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: ZohSizes.xs,
              ),
              Row(
                children: [
                  Text(
                    'Asked For: ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: dark ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      'Block: $room  Room No: $block',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Reason: ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: dark ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      reason,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: ZohSizes.spaceBtwZoh,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: reject,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(fontSize: 20),
                        minimumSize: const Size(0, 30),
                        side: const BorderSide(color: Colors.red),
                        elevation: 5,
                      ),
                      child: const Text(
                        ZohTextString.reject,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IBMPlexSans',
                            fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: ZohSizes.md,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: approve,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: const TextStyle(fontSize: 20),
                        minimumSize: const Size(0, 30),
                        side: const BorderSide(color: Colors.green),
                        elevation: 5,
                      ),
                      child: const Text(
                        ZohTextString.approve,
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
            ],
          ),
        ),
      ),
    );
  }
}
