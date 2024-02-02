// ignore_for_file: file_names

import 'dart:developer';

import 'package:door_shark/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:validators/validators.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({super.key});

  @override
  State<CustomerSignUp> createState() => _SignUpState();
}

class _SignUpState extends State<CustomerSignUp> {
  //textfield properties
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordNoController = TextEditingController();
  final TextEditingController confirmpasswordNoController =
      TextEditingController();
  final TextEditingController secondaryAddressController =
      TextEditingController();
  final TextEditingController primaryAddressController =
      TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  String initialCountry = 'GB';
  PhoneNumber number = PhoneNumber(isoCode: 'GB');
  String dialcode = "+44";

  bool hidepass = true;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordNoController.dispose();
    confirmpasswordNoController.dispose();
    primaryAddressController.dispose();
    secondaryAddressController.dispose();
    phonenumbercontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          toolbarHeight: 110.h,
          title: Text('Sign Up',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontFamily: 'Montserrat',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            },
          ),
          iconTheme: const IconThemeData(
              color:
                  Colors.white), // Add this line to change arrow color to white
        ),
        body: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Expanded(
                  child: Container(
                    width: 430.w,
                    height: 672.h,
                    padding: EdgeInsets.symmetric(horizontal: 5.r),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          left: 25.w, right: 25.w, top: 30.h, bottom: 100.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ////////////////////////////

                          SizedBox(
                            //height: 50.h,
                            //width: 380.w,
                            child: TextFormField(
                              // /  maxLength: 50,
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              autofocus: false,
                              validator: (val) {
                                if (!RegExp(
                                        r"^([a-zA-Z]{0,50})(?:\s[a-zA-Z]+)?(?:\s[a-zA-Z]{0,50})?$")
                                    .hasMatch(val!.trim())) {
                                  return 'Name should only contain alphabets';
                                } else if (val.isEmpty) {
                                  return 'What\'s your name?';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey.shade900,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.w),
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  //isDense: true,
                                  //counter: SizedBox.shrink(),
                                  // helperText: "",

                                  // prefixIcon: const Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffe0c47d),
                                  // ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Enter Name",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          SizedBox(
                            // height: 50.h,
                            //width: 380.w,
                            child: TextFormField(
                              //maxLength: 50,
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              autofocus: false,
                              validator: (val) {
                                //if email

                                if (val!.isEmpty) {
                                  return 'What\'s your email?';
                                } else if (!isEmail(val.trim())) {
                                  return 'Please enter a valid email';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey.shade900,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.w),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  //isDense: true,
                                  //counter: SizedBox.shrink(),
                                  // helperText: "",

                                  // prefixIcon: const Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffe0c47d),
                                  // ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Enter Name",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            //  height: 80.h,
                            //     context.read<ScreenUtil>().screenHeightDp! * 0.1,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20.r)),
                            child: InternationalPhoneNumberInput(
                              maxLength: 10,
                              selectorTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.black87),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.black87),
                              inputDecoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  errorStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.red,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  hintText: "Enter your number",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),

                                  // labelText: "Enter your password",
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  fillColor: Colors.white,
                                  filled: true),
                              spaceBetweenSelectorAndTextField: 5.w,
                              hintText: "Enter phone number",
                              onInputChanged: (PhoneNumber number) {
                                dialcode = number.dialCode!;
                                this.number = number;
                              },
                              onInputValidated: (bool value) {
                                //
                                log(number.phoneNumber.toString());
                              },
                              onSubmit: () {},
                              onFieldSubmitted: (val) {
                                //  log(val.toString());
                              },
                              selectorConfig: SelectorConfig(
                                  leadingPadding: 2.w,
                                  selectorType:
                                      PhoneInputSelectorType.BOTTOM_SHEET,
                                  trailingSpace: false),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              validator: (val) {
                                //if phonenumber
                                if (val!.isEmpty) {
                                  return 'What\'s your phone number?';
                                } else if (!isNumeric(val)) {
                                  return 'only digits allowed';
                                } else {
                                  return null;
                                }
                              },
                              initialValue: number,
                              scrollPadding: EdgeInsets.all(10),
                              textFieldController: phonenumbercontroller,
                              formatInput: false,
                              keyboardType: TextInputType.phone,
                              inputBorder: InputBorder.none,
                              onSaved: (PhoneNumber number) {
                                //
                                // formkey.currentState!.validate();

                                // dialcode = number.dialCode!;
                                // this.number = number;
                                // log(number.phoneNumber.toString());
                              },
                            ),
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          SizedBox(
                            //height: 50.h,
                            child: TextFormField(
                              // maxLength: 20,
                              obscureText: hidepass,
                              controller: passwordNoController,
                              autofocus: false,
                              validator: (val) {
                                if (val!.isNotEmpty && val.length < 6) {
                                  return 'Password must be at least 6 digits long';
                                } else if (val.isEmpty) {
                                  return 'Password required';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey.shade900,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.w),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        hidepass = !hidepass;
                                      });
                                    }),
                                    child: Icon(
                                      !hidepass
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xff808080)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Enter Name",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          //confirm password

                          SizedBox(
                            // height: 50.h,
                            child: TextFormField(
                              //maxLength: 20,
                              obscureText: hidepass,
                              controller: confirmpasswordNoController,
                              autofocus: false,
                              validator: (val) {
                                if (val!.isNotEmpty &&
                                    val != passwordNoController.text) {
                                  return 'Password does not match.';
                                } else if (val.isEmpty) {
                                  return 'Confirm Password required';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey.shade900,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.w),
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: (() {
                                      setState(() {
                                        hidepass = !hidepass;
                                      });
                                    }),
                                    child: Icon(
                                      !hidepass
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: const Color(0xff808080)
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Enter Name",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            // height: 50.h,
                            //width: 380.w,
                            child: TextFormField(
                              // /  maxLength: 50,
                              controller: primaryAddressController,
                              keyboardType: TextInputType.multiline,
                              autofocus: false,

                              maxLines: null,
                              validator: (val) {
                                if (val != null && val.isEmpty) {
                                  return 'What\'s your Primary Address?';
                                } else if (val!.length < 10) {
                                  return 'Address length too small ';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey.shade900,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.w),
                                  hintText: "Primary Address",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  //isDense: true,
                                  //counter: SizedBox.shrink(),
                                  // helperText: "",

                                  // prefixIcon: const Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffe0c47d),
                                  // ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Enter Name",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            // height: 50.h,
                            //width: 380.w,
                            child: TextFormField(
                              // /  maxLength: 50,
                              controller: secondaryAddressController,
                              keyboardType: TextInputType.multiline,
                              autofocus: false,

                              maxLines: null,
                              validator: (val) {
                                if (val != null && val.isEmpty) {
                                  return 'What\'s your Secondary Address?';
                                } else if (val!.length < 10) {
                                  return 'Address length too small ';
                                } else {
                                  return null;
                                }
                              },
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey.shade900,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 5.w),
                                  hintText: "Secondary Address",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  //isDense: true,
                                  //counter: SizedBox.shrink(),
                                  // helperText: "",

                                  // prefixIcon: const Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffe0c47d),
                                  // ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.r)),
                                    borderSide: BorderSide(color: Colors.grey),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Enter Name",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),

                          ///

                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            width: 250,
                            child: Divider(
                              thickness: 1,
                              color: Color(0xFFe0c47d),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 380.w,
                            height:
                                50.h, // Adjust the width based on your design
                            child: ElevatedButton(
                              onPressed: () {
                                log(number.phoneNumber.toString());
                                if (!formkey.currentState!.validate()) {
                                  return;
                                }
                                // // Navigator.of(context).pushNamed("/2ndscreen");
                                // Navigator.pushNamed(context, RoutesName.selectUser);
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Colors.blue.shade900, // Button text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      20.r), // Rounded corners
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                ), // Button padding
                              ),
                              child: Text(
                                'Proceed',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have a account? ",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.blue.shade900,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.normal,
                                    )),
                                TextButton(
                                  onPressed: (() {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => const Signin()));
                                  }),
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: Size(80.w, 40.h),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      alignment: Alignment.center),
                                  child: Text("Log In",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.blue.shade900,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
