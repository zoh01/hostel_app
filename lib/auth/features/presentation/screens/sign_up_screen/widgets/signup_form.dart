import 'package:flutter/material.dart';
import 'package:hostel_app/api_services/api_calls.dart';
import 'package:hostel_app/utils/helpers/helper_functions.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_string.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isSecuredWariz = true;
  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  ApiCall apiCall = ApiCall();

  String? selectedBlock;
  String? selectedRoom;

  List<String> blockOptions = ['A', 'B'];
  List<String> roomOptionsA = ['101', '102', '103'];
  List<String> roomOptionsB = ['201', '202', '203'];

  @override
  void dispose() {
    firstnameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = ZohHelperFunction.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// FullName
          Text(
            'Full Name',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: dark ? Colors.white54 : Colors.black54),
          ),

          const SizedBox(
            height: ZohSizes.sm,
          ),

          /// FullName TextForm
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstnameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Fill empty field';
                    }
                    return null;
                  },
                  cursorColor: dark ? Colors.white : Colors.black,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                      color: dark ? Colors.white : Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: dark ? Colors.white : Colors.black,
                      ),
                      fillColor:
                          dark ? ZohColors.darkContainer : Colors.white54,
                      hintText: 'First Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark ? Colors.white : Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: dark ? Colors.white : Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
              const SizedBox(width: ZohSizes.spaceBtwItems),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  validator: (zoh) {
                    if (zoh!.isEmpty) {
                      return 'Fill empty field';
                    }
                    return null;
                  },
                  cursorColor: dark ? Colors.white : Colors.black,
                  keyboardType: TextInputType.name,
                  style: TextStyle(
                      color: dark ? Colors.white : Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: dark ? Colors.white : Colors.black,
                      ),
                      fillColor:
                          dark ? ZohColors.darkContainer : Colors.white54,
                      hintText: 'Last Name',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: dark ? Colors.white : Colors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: dark ? Colors.white : Colors.black,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)))),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: ZohSizes.spaceBtwZoh,
          ),

          /// UserName
          Text(
            'Username',
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
            controller: userNameController,
            validator: (wariz) {
              if (wariz!.isEmpty) {
                return 'Fill empty field';
              }
              return null;
            },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: TextInputType.name,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.person,
                  color: dark ? Colors.white : Colors.black,
                ),
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: 'Enter Username',
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

          const SizedBox(
            height: ZohSizes.spaceBtwZoh,
          ),

          /// Email
          Text(
            'Email Address',
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
            controller: emailController,
            validator: (lara) {
              if (lara!.isEmpty) {
                return 'Email is required';
              } else if (!emailRegex.hasMatch(lara)) {
                return 'Invalid email address';
              }
              return null;
            },
            cursorColor: dark ? Colors.white : Colors.black,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(
                  Icons.email,
                  color: dark ? Colors.white : Colors.black,
                ),
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: 'Enter Email',
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

          const SizedBox(
            height: ZohSizes.spaceBtwZoh,
          ),

          /// Phone Number
          Text(
            'Phone Number',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: dark ? Colors.white54 : Colors.black54),
          ),

          const SizedBox(height: ZohSizes.sm),

          IntlPhoneField(
            controller: phoneNumberController,
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
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: 'Phone Number',
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

          const SizedBox(
            height: ZohSizes.sm,
          ),

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
                suffixIcon: toggleWariz(),
                fillColor: dark ? ZohColors.darkContainer : Colors.white54,
                hintText: 'Enter Password',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dark ? Colors.white : Colors.black,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: dark ? Colors.white : Colors.black,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(15.0)))),
            obscureText: _isSecuredWariz,
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
                        DropdownButton<String>(
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
                            return DropdownMenuItem<String>(
                              value: block,
                              child: Text(block),
                            );
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
            height: ZohSizes.spaceBtwSections,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print(selectedBlock);
                print(selectedRoom);
                if (_formKey.currentState!.validate()) {
                  apiCall.registerStudent(
                    context,
                    userNameController.text,
                    firstnameController.text,
                    lastNameController.text,
                    phoneNumberController.text,
                    selectedBlock ?? "",
                    selectedRoom ?? "",
                    emailController.text,
                    passwordController.text,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ZohColors.primaryColor,
                  textStyle: const TextStyle(fontSize: 28),
                  minimumSize: const Size(0, 60),
                  side: const BorderSide(color: ZohColors.primaryColor),
                  elevation: 5),
              child: const Text(
                ZohTextString.createAccount,
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

  Widget toggleWariz() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecuredWariz = !_isSecuredWariz;
        });
      },
      icon: _isSecuredWariz
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

  final emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$');
}
