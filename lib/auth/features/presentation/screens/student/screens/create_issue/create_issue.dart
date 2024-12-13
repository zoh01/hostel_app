import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/sign_up_screen/signup_screen.dart';
import 'package:hostel_app/auth/features/presentation/screens/student/screens/create_issue/widgets/form_container.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_string.dart';
import '../../../home/screens/home_widgets/comment_form_field.dart';

class CreateIssue extends StatefulWidget {
  const CreateIssue({super.key});

  @override
  State<CreateIssue> createState() => _CreateIssueState();
}

class _CreateIssueState extends State<CreateIssue> {
  String? selectedIssue;
  List<String> issues = [
    "Bathroom",
    "Bedroom",
    "Water",
    "Kitchen",
    "Furniture",
  ];

  final _zohKey = GlobalKey<FormState>();
  final commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
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
          'Create Issue',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: ZohSizes.defaultSpace,
            left: ZohSizes.defaultSpace,
            right: ZohSizes.defaultSpace,
            bottom: ZohSizes.spaceBtwSections,
          ),
          child: Form(
            key: _zohKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormContainer(
                  title: 'Room Number',
                  hintText: '202',
                ),

                const SizedBox(
                  height: ZohSizes.spaceBtwZoh,
                ),

                const FormContainer(title: 'Block Number', hintText: 'A'),

                const SizedBox(
                  height: ZohSizes.spaceBtwZoh,
                ),

                const FormContainer(
                    title: 'Your Email ID', hintText: 'adebayozoh@gmail.com'),

                const SizedBox(
                  height: ZohSizes.spaceBtwZoh,
                ),

                const FormContainer(
                    title: 'Phone Number', hintText: '07025136608'),

                const SizedBox(
                  height: ZohSizes.spaceBtwZoh,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Issue you are facing',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: dark ? Colors.white54 : Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: ZohSizes.sm,
                    ),
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
                      child: DropdownButton(
                        padding:
                            const EdgeInsets.symmetric(horizontal: ZohSizes.sm),
                        borderRadius: BorderRadius.circular(30),
                        dropdownColor:
                            dark ? ZohColors.darkerGrey : Colors.white,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: dark ? Colors.white54 : Colors.black54,
                        ),
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: selectedIssue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedIssue = newValue;
                          });
                        },
                        items: issues.map((String issue) {
                          return DropdownMenuItem(
                              value: issue, child: Text(issue));
                        }).toList(),
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: ZohSizes.spaceBtwZoh,
                ),

                /// Email
                CommentFormField(
                  controller: commentController,
                  validate: 'Comment is required.',
                  inputType: TextInputType.multiline,
                  title: 'Enter Comment',
                  hintText: 'Comment',
                ),
                const SizedBox(
                  height: ZohSizes.spaceBtwSections,
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_zohKey.currentState!.validate()) {
                        print('Loading');
                      }
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
