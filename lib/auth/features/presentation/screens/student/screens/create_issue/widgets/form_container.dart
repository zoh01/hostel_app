import 'package:flutter/material.dart';

import '../../../../../../../../utils/constants/colors.dart';
import '../../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../../utils/helpers/helper_functions.dart';

class FormContainer extends StatelessWidget {
  final String title;
  final String hintText;

  const FormContainer({
    required this.title,
    required this.hintText,
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
              side: const BorderSide(color: ZohColors.primaryColor, width: 3),
            ),
            color: dark ? Colors.black26 : Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(ZohSizes.sm),
            child: Text(
              hintText,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: dark ? Colors.white54 : Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
