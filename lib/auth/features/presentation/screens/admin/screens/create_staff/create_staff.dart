import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hostel_app/auth/features/presentation/screens/admin/screens/create_staff/widgets/custom_form.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../utils/constants/text_string.dart';

class CreateStaff extends StatefulWidget {
  const CreateStaff({super.key});

  @override
  State<CreateStaff> createState() => _CreateStaffState();
}

class _CreateStaffState extends State<CreateStaff> {
  bool _isSecuredZoh = true;

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final jobRoleController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    jobRoleController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNoController.dispose();
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
          'Create Staff',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: ZohSizes.defaultSpace,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZohSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                        title: 'Username',
                        hintText: 'Enter Username',
                        inputType: TextInputType.name,
                        controller: usernameController,
                        validate: 'Input Username'),
                    const SizedBox(
                      height: ZohSizes.spaceBtwZoh,
                    ),
                    CustomFormField(
                        title: 'First Name',
                        hintText: 'First Name',
                        inputType: TextInputType.name,
                        controller: firstnameController,
                        validate: 'Input Firstname'),
                    const SizedBox(
                      height: ZohSizes.spaceBtwZoh,
                    ),
                    CustomFormField(
                        title: 'Last Name',
                        hintText: 'Last Name',
                        inputType: TextInputType.name,
                        controller: lastnameController,
                        validate: 'Input Lastname'),
                    const SizedBox(
                      height: ZohSizes.spaceBtwZoh,
                    ),
                    CustomFormField(
                        title: 'Job Role',
                        hintText: 'Job Role',
                        inputType: TextInputType.text,
                        controller: jobRoleController,
                        validate: 'Input Job Role'),
                    const SizedBox(
                      height: ZohSizes.spaceBtwZoh,
                    ),
                    CustomFormField(
                        title: 'Email Address',
                        hintText: 'Enter Email',
                        inputType: TextInputType.emailAddress,
                        controller: emailController,
                        validate: 'Input Email'),
                    const SizedBox(
                      height: ZohSizes.spaceBtwZoh,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Password
                        Text(
                          'Password',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: dark ? Colors.white54 : Colors.black54),
                        ),

                        const SizedBox(
                          height: ZohSizes.sm,
                        ),

                        /// Password
                        TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Fill empty field';
                            }
                            return null;
                          },
                          cursorColor: dark ? Colors.white : Colors.black,
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                              color: dark ? Colors.white : Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(
                                Icons.password,
                                color: dark ? Colors.white : Colors.black,
                              ),
                              suffixIcon: toggleZoh(),
                              fillColor: dark
                                  ? ZohColors.darkContainer
                                  : Colors.white54,
                              hintText: 'Enter Password',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: dark ? Colors.white : Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: dark ? Colors.white : Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)))),
                          obscureText: _isSecuredZoh,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: ZohSizes.spaceBtwZoh,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: dark ? Colors.white54 : Colors.black54),
                        ),
                        const SizedBox(
                          height: ZohSizes.sm,
                        ),
                        IntlPhoneField(
                          controller: phoneNoController,
                          cursorColor: dark ? Colors.white : Colors.black,
                          keyboardType: TextInputType.phone,
                          initialCountryCode: 'NG',
                          style: TextStyle(
                            color: dark ? Colors.white : Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            fontWeight: FontWeight.normal,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: dark
                                  ? ZohColors.darkContainer
                                  : Colors.white54,
                              hintText: 'Phone Number',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          dark ? Colors.white : Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: dark ? Colors.white : Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15.0)))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: ZohSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Loading');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ZohColors.primaryColor,
                            textStyle: const TextStyle(fontSize: 28),
                            minimumSize: const Size(0, 60),
                            side:
                                const BorderSide(color: ZohColors.primaryColor),
                            elevation: 5),
                        child: const Text(
                          ZohTextString.createStaffBtn,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget toggleZoh() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecuredZoh = !_isSecuredZoh;
        });
      },
      icon: _isSecuredZoh
          ? Icon(
              Icons.visibility_off,
              color: ZohHelperFunction.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            )
          : Icon(
              Icons.visibility,
              color: ZohHelperFunction.isDarkMode(context)
                  ? Colors.white
                  : Colors.black,
            ),
    );
  }
}
