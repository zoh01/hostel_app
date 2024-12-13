import 'package:flutter/material.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/sizes.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String validate;

  const CustomFormField({
    required this.title,
    required this.hintText,
    required this.inputType,
    required this.controller,
    required this.validate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Email
          Text(
            title,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: dark ? Colors.white54 : Colors.black54),
          ),

          const SizedBox(
            height: ZohSizes.sm,
          ),

          /// Email
          TextFormField(
            controller: controller,
            validator: (zoh) {
              if (zoh!.isEmpty) {
                return validate;
              }
              return null;
            },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: inputType,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                filled: true,
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: hintText,
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: dark ? Colors.white : Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dark ? Colors.white : Colors.black,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0)))),
          ),
        ],
      );
  }
}
