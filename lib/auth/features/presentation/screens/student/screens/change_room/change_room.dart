import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../api_services/api_utils.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_string.dart';
import '../../../home/screens/home_widgets/comment_form_field.dart';

class ChangeRoom extends StatefulWidget {
  const ChangeRoom({super.key});

  @override
  State<ChangeRoom> createState() => _ChangeRoomState();
}

class _ChangeRoomState extends State<ChangeRoom> {
  final reasonController = TextEditingController();
  final _formZoh = GlobalKey<FormState>();
  String? selectedBlock;
  String? selectedRoom;
  ApiCall apiCall = ApiCall();

  List<String> blockOptions = ['A', 'B'];
  List<String> roomOptionsA = ['101', '102', '103'];
  List<String> roomOptionsB = ['201', '202', '203'];

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

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
          'Room Change Request',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Form(
            key: _formZoh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Current block & Room No.
                Text(
                  'Block & Room No',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: dark ? Colors.white54 : Colors.black54),
                ),
                const SizedBox(
                  height: ZohSizes.md,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: ZohColors.primaryColor, width: 3),
                          ),
                          color: dark ? Colors.black26 : Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(ZohSizes.sm),
                          child: Text(
                            'Room No - ${ApiUtils.roomNumber}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: dark ? Colors.white54 : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: ZohSizes.sm,
                    ),
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: const BorderSide(
                                color: ZohColors.primaryColor, width: 3),
                          ),
                          color: dark ? Colors.black26 : Colors.black12,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(ZohSizes.sm),
                          child: Text(
                            'Block No - ${ApiUtils.blockNumber}',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: dark ? Colors.white54 : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: ZohSizes.spaceBtwZoh,
                ),

                /// Block & Room
                Text(
                  'Block & Room No',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: dark ? Colors.white54 : Colors.black54),
                ),

                const SizedBox(
                  height: ZohSizes.md,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 3, color: ZohColors.primaryColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: ZohSizes.iconXs, right: ZohSizes.iconXs),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Block No.'),
                              DropdownButton(
                                dropdownColor: ZohColors.darkGrey,
                                borderRadius: BorderRadius.circular(15),
                                underline: const SizedBox(),
                                value: selectedBlock,
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      selectedBlock = newValue;
                                      selectedRoom = null;
                                    },
                                  );
                                },
                                items: blockOptions.map((String block) {
                                  return DropdownMenuItem(
                                      value: block, child: Text(block));
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: ZohSizes.sm,
                    ),
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 3, color: ZohColors.primaryColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: ZohSizes.iconXs, right: ZohSizes.iconXs),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Room No.'),
                              DropdownButton<String>(
                                dropdownColor: ZohColors.darkGrey,
                                borderRadius: BorderRadius.circular(15),
                                underline: const SizedBox(),
                                value: selectedRoom,
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      selectedRoom = newValue;
                                    },
                                  );
                                },
                                items: (selectedBlock == "A"
                                        ? roomOptionsA
                                        : roomOptionsB)
                                    .map((String room) {
                                  return DropdownMenuItem<String>(
                                    value: room,
                                    child: Text(room),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: ZohSizes.md,
                ),

                /// Email
                CommentFormField(
                  controller: reasonController,
                  validate: 'Reason is required.',
                  inputType: TextInputType.multiline,
                  title: 'Reason for change',
                  hintText: 'Write your reason',
                ),
                const SizedBox(
                  height: ZohSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formZoh.currentState!.validate()) {
                        print('Loading');
                      }
                      /// Show progress indicator while submitting...
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white70,
                              ));
                        },
                      );
                      apiCall.roomChangeRequestZoh(
                        context,
                        selectedRoom!,
                        selectedBlock!,
                        reasonController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ZohColors.primaryColor,
                        textStyle: const TextStyle(fontSize: 28),
                        minimumSize: const Size(0, 60),
                        side: const BorderSide(color: ZohColors.primaryColor),
                        elevation: 5),
                    child: const Text(
                      ZohTextString.submit,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'IBMPlexSans',
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
