import 'package:flutter/material.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../../api_services/api_calls.dart';
import '../../../../../../../../api_services/api_utils.dart';
import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/constants/text_string.dart';
import '../../../../home/screens/home_widgets/comment_form_field.dart';
import 'form_container.dart';

class CreateIssueForm extends StatefulWidget {
  const CreateIssueForm({super.key});

  @override
  State<CreateIssueForm> createState() => _CreateIssueFormState();
}

class _CreateIssueFormState extends State<CreateIssueForm> {

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

  ApiCall apiCall = ApiCall();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Form(
      key: _zohKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormContainer(
            title: 'Room Number',
            hintText: ApiUtils.roomNumber,
          ),

          const SizedBox(
            height: ZohSizes.spaceBtwZoh,
          ),

          FormContainer(
              title: 'Block Number', hintText: ApiUtils.blockNumber),

          const SizedBox(
            height: ZohSizes.spaceBtwZoh,
          ),

          FormContainer(
              title: 'Your Email ID', hintText: ApiUtils.email),

          const SizedBox(
            height: ZohSizes.spaceBtwZoh,
          ),

          FormContainer(
              title: 'Phone Number', hintText: ApiUtils.phoneNumber),

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
                  padding: const EdgeInsets.symmetric(
                      horizontal: ZohSizes.sm),
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
                  apiCall.createAnIssue(
                    context,
                    ApiUtils.roomNumber,
                    ApiUtils.blockNumber,
                    selectedIssue ?? "",
                    commentController.text,
                    ApiUtils.email,
                    ApiUtils.phoneNumber,
                  );
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
    );
  }
}
