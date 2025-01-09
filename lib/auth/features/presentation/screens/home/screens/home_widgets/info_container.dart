import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/create_issue/create_issue.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../api_services/api_utils.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/image_string.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';

class InfoContainer extends StatefulWidget {
  const InfoContainer({
    super.key,
  });

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  bool omoLara = true;
  bool zoh = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    loadZoh();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      omoLara = false;
    });
  }

  loadZoh() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      zoh = false;
    });
  }

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
      child: omoLara
          ? Shimmer.fromColors(
              baseColor: dark ? ZohColors.darkGrey : Colors.white,
              highlightColor: Colors.transparent,
              enabled: omoLara,
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
                              width:
                                  ZohDeviceUtils.getScreenWidth(context) * .2),
                        ),
                        const SizedBox(
                          height: ZohSizes.sm,
                        ),
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
            )
          : Row(
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
                  child: zoh
                      ? Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.transparent,
                          enabled: zoh,
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
                                    width:
                                        ZohDeviceUtils.getScreenWidth(context) *
                                            .2),
                              ),
                              const SizedBox(
                                height: ZohSizes.sm,
                              ),
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
                      : Column(
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
                                  width:
                                      ZohDeviceUtils.getScreenWidth(context) *
                                          .2),
                            ),
                            const SizedBox(
                              height: ZohSizes.sm,
                            ),
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
