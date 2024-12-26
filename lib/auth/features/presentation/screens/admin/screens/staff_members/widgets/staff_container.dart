import 'package:flutter/material.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/models/staff_info_model.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/image_string.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/constants/text_string.dart';
import '../../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../../utils/helpers/helper_functions.dart';


class StaffContainer extends StatefulWidget {
  final Result staff;

  const StaffContainer({
    required this.staff,
    super.key,
  });

  @override
  State<StaffContainer> createState() => _StaffContainerState();
}

class _StaffContainerState extends State<StaffContainer> {
  ApiCall apiCall = ApiCall();

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ZohSizes.md,
        vertical: ZohSizes.md
      ),
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
            children: [
              Row(
                children: [
                  Image(
                      image: const AssetImage(ZohImageString.user),
                      width: ZohDeviceUtils.getScreenWidth(context) * .2),
                  const SizedBox(
                    width: ZohSizes.spaceBtwZoh,
                  ),
                  Expanded(
                    child: Text(
                      '${widget.staff.jobRole}',
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
                height: ZohSizes.spaceBtwItems,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'First Name: ${widget.staff.firstName}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Last Name: ${widget.staff.lastName}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Email: ${widget.staff.emailId}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Phone No: ${widget.staff.phoneNumber}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      color: dark ? Colors.white54 : Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: ZohSizes.spaceBtwZoh,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    apiCall.deleteStaff(context, widget.staff.emailId);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size(0, 30),
                    side: const BorderSide(color: Colors.red),
                    elevation: 5,
                  ),
                  child: const Text(
                    ZohTextString.delete,
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