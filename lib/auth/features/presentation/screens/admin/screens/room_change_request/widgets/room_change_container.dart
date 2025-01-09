import 'package:flutter/material.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/models/room_change_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/image_string.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/constants/text_string.dart';
import '../../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../../utils/helpers/helper_functions.dart';

class RoomChangeContainer extends StatefulWidget {
  final Result roomInfo;

  const RoomChangeContainer({
    required this.roomInfo,
    super.key,
  });

  @override
  State<RoomChangeContainer> createState() => _RoomChangeContainerState();
}

class _RoomChangeContainerState extends State<RoomChangeContainer> {
  bool omoLara = true;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    laraData();
  }
  
  laraData() async{
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      omoLara = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    ApiCall apiCall = ApiCall();
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
          child: omoLara ? Shimmer.fromColors(
            baseColor: dark ? ZohColors.primaryColor.withOpacity(0.6) : Colors.white,
            highlightColor:Colors.transparent,
            enabled: omoLara,
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
                        "${widget.roomInfo.studentDetails.firstName} ${widget.roomInfo.studentDetails.lastName}",
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
                      'Username: ${widget.roomInfo.studentDetails.userName}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Current Room: ${widget.roomInfo.currentRoomNumber}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Current Block: ${widget.roomInfo.currentBlock}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email ID: ${widget.roomInfo.studentDetails.emailId}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Phone No: ${widget.roomInfo.studentDetails.phoneNumber}',
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
                        'Block: ${widget.roomInfo.toChangeBlock}  Room No: ${widget.roomInfo.toChangeRoomNumber}',
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
                        widget.roomInfo.changeReason,
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
                        onPressed: () {
                          apiCall.approveOrReject(
                            context,
                            "REJECTED",
                            "REJECTED",
                            widget.roomInfo.roomChangeRequestId,
                          );
                          /// Show progress indicator while Rejecting staff...
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white70,
                                  ));
                            },
                          );
                        },
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
                        onPressed: () {
                          apiCall.approveOrReject(
                            context,
                            "APPROVED",
                            "APPROVED",
                            widget.roomInfo.roomChangeRequestId,
                          );
                          /// Show progress indicator while Approving request...
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white70,
                                  ));
                            },
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
          ) : Column(
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
                      "${widget.roomInfo.studentDetails.firstName} ${widget.roomInfo.studentDetails.lastName}",
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
                    'Username: ${widget.roomInfo.studentDetails.userName}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Current Room: ${widget.roomInfo.currentRoomNumber}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Current Block: ${widget.roomInfo.currentBlock}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Email ID: ${widget.roomInfo.studentDetails.emailId}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Phone No: ${widget.roomInfo.studentDetails.phoneNumber}',
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
                      'Block: ${widget.roomInfo.toChangeBlock}  Room No: ${widget.roomInfo.toChangeRoomNumber}',
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
                      widget.roomInfo.changeReason,
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
                      onPressed: () {
                        apiCall.approveOrReject(
                          context,
                          "REJECTED",
                          "REJECTED",
                          widget.roomInfo.roomChangeRequestId,
                        );
                        /// Show progress indicator while Rejecting request...
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white70,
                                ));
                          },
                        );
                      },
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
                      onPressed: () {
                        apiCall.approveOrReject(
                          context,
                          "APPROVED",
                          "APPROVED",
                          widget.roomInfo.roomChangeRequestId,
                        );
                        /// Show progress indicator while Approving request...
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white70,
                                ));
                          },
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
