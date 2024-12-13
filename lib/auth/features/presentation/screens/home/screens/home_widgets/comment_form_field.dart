import 'package:flutter/material.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/helpers/helper_functions.dart';


class CommentFormField extends StatelessWidget {
  final TextInputType inputType;
  final String title;
  final String hintText;
  final String validate;
  final TextEditingController controller;
  const CommentFormField({
    required this.inputType,
    required this.title,
    required this.hintText,
    required this.validate,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

        /// Username
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return validate;
            }
            return null;
          },
          cursorColor: dark ? Colors.white : Colors.black,
          keyboardType: inputType,
          minLines: 2,
          maxLines: null,
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