import 'package:flutter/material.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/models/issue_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/image_string.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/constants/text_string.dart';
import '../../../../../../../../utils/device/device_utilities.dart';
import '../../../../../../../../utils/helpers/helper_functions.dart';

class IssuesContainer extends StatefulWidget {
  final Result issue;

  const IssuesContainer({
    required this.issue,
    super.key,
  });

  @override
  State<IssuesContainer> createState() => _IssuesContainerState();
}

class _IssuesContainerState extends State<IssuesContainer> {
  bool zoh = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    zohData();
  }

  zohData () async{
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      zoh = false;
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
          child: zoh ? Shimmer.fromColors(
            baseColor: dark ? ZohColors.primaryColor.withOpacity(0.6) : Colors.white,
            highlightColor:Colors.transparent,
            enabled: zoh,
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
                        '${widget.issue.studentDetails.firstName} ${widget.issue.studentDetails.lastName}',
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
                      'Username: ${widget.issue.studentDetails.userName}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Room No: ${widget.issue.roomDetails.roomNumber}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email ID: ${widget.issue.studentEmailId}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: dark ? Colors.white70 : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Phone No: ${widget.issue.studentDetails.phoneNumber}',
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
                      'Issue: ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: dark ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        widget.issue.issue,
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
                      'Comment: ',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: dark ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        widget.issue.studentComment,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      apiCall.closeAnIssue(context, "RESOLVED",
                          widget.issue.issueId.toString());
                      /// Show progress indicator while resolving...
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
                      backgroundColor: Colors.blue,
                      textStyle: const TextStyle(fontSize: 20),
                      minimumSize: const Size(0, 30),
                      side: const BorderSide(color: Colors.blue),
                      elevation: 5,
                    ),
                    child: const Text(
                      ZohTextString.resolve,
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
                      '${widget.issue.studentDetails.firstName} ${widget.issue.studentDetails.lastName}',
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
                    'Username: ${widget.issue.studentDetails.userName}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Room No: ${widget.issue.roomDetails.roomNumber}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Email ID: ${widget.issue.studentEmailId}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        color: dark ? Colors.white70 : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Phone No: ${widget.issue.studentDetails.phoneNumber}',
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
                    'Issue: ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: dark ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      widget.issue.issue,
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
                    'Comment: ',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: dark ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      widget.issue.studentComment,
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    apiCall.closeAnIssue(context, "RESOLVED",
                        widget.issue.issueId.toString());
                    /// Show progress indicator while resolving...
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
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size(0, 30),
                    side: const BorderSide(color: Colors.blue),
                    elevation: 5,
                  ),
                  child: const Text(
                    ZohTextString.resolve,
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
