import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/utils/constants/image_string.dart';
import 'package:hostel_app/utils/device/device_utilities.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';

class HostelFee extends StatelessWidget {
  const HostelFee({super.key});

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
          'Hostel Fee',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.md),
          child: Center(
            child: Column(
              children: [
                Image(
                  image: const AssetImage(
                    ZohImageString.hostelFee,
                  ),
                  height: ZohDeviceUtils.getScreenHeight() * .2,
                ),
                const SizedBox(height: ZohSizes.spaceBtwItems,),
                Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                          color: ZohColors.primaryColor, width: 3),
                    ),
                    color: dark ? Colors.black26 : Colors.black12,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(ZohSizes.md),
                    child: Column(
                      children: [
                        const Text(
                          'Hostel Details',
                          style: TextStyle(
                              fontFamily: 'IBM_Plex_Sans',
                              fontSize: ZohSizes.spaceBtwZoh,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: ZohSizes.spaceBtwZoh,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Block No',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: dark ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'B',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        const SizedBox(height: ZohSizes.sm,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Room No',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: dark ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '202',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height:  ZohSizes.md,),

                        const Text(
                          'Payment Details',
                          style: TextStyle(
                              fontFamily: 'IBM_Plex_Sans',
                              fontSize: ZohSizes.spaceBtwZoh,
                              fontWeight: FontWeight.bold),
                        ),

                        const SizedBox(height: ZohSizes.spaceBtwZoh,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Maintenance charge',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: dark ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: ZohSizes.md,),
                            Text(
                              '# 5,000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height:  ZohSizes.md,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Parking charge',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: dark ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: ZohSizes.md,),
                            Text(
                              '#3 000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height:  ZohSizes.md,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Water charge',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: dark ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: ZohSizes.md,),
                            Text(
                              '# 10,000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height:  ZohSizes.md,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Room Charge',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: dark ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: ZohSizes.md,),
                            Text(
                              '# 350,000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height:  ZohSizes.md,),

                        const Divider(
                          color: Colors.grey,
                        ),

                        const SizedBox(height:  ZohSizes.md,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Total Amount',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20,
                                    color: dark ? Colors.white : Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '# 368,000',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 17,
                                  color: dark ? Colors.white70 : Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
