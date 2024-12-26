import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/create_issue/create_issue.dart';

import '../../../../../../../api_services/api_utils.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/image_string.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: const BorderSide(color: ZohColors.primaryColor, width: 3),
        ),
        color: dark ? Colors.black26 : Colors.black12,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(ZohSizes.md),
            child: SizedBox(
              width: ZohDeviceUtils.getScreenWidth(context) * .4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${ApiUtils.firstName} ${ApiUtils.lastName}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontFamily: 'IBM_Plex_Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: ZohSizes.defaultSpace,
                    ),
                  ),
                  const SizedBox(
                    height: ZohSizes.spaceBtwSections,
                  ),
                  Text(
                    'Room No : ${ApiUtils.roomNumber}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: ZohSizes.sm,
                  ),
                  Text(
                    'Block No : ${ApiUtils.blockNumber}',
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(ZohSizes.md),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const CreateIssue(),
                      ),
                    );
                  },
                  child: Image(
                      image: const AssetImage(
                        ZohImageString.document3,
                      ),
                      width: ZohDeviceUtils.getScreenWidth(context) * .2),
                ),
                const SizedBox(height: ZohSizes.sm,),
                const Text(
                  'Create Issue.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: ZohSizes.md),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
