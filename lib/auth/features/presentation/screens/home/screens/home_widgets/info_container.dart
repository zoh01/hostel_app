import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/create_issue/create_issue.dart';

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
          const Padding(
            padding: EdgeInsets.all(ZohSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adebayo Wariz',
                  style: TextStyle(
                    fontFamily: 'IBM_Plex_Sans',
                    fontWeight: FontWeight.bold,
                    fontSize: ZohSizes.defaultSpace,
                  ),
                ),
                SizedBox(
                  height: ZohSizes.spaceBtwSections,
                ),
                Text(
                  'Room No : 103',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: ZohSizes.sm,
                ),
                Text(
                  'Block No : A',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                )
              ],
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
