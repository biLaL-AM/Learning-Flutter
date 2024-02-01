// ignore_for_file: file_names

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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordNoController = TextEditingController();
  final TextEditingController confirmpasswordNoController =
      TextEditingController();
  final TextEditingController verificationCodeController =
      TextEditingController();
  final TextEditingController phonenumbercontroller = TextEditingController();
  String initialCountry = 'GB';
  PhoneNumber number = PhoneNumber(isoCode: 'GB');
  String dialcode = "+44";

  bool hidepass = true;

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordNoController.dispose();
    confirmpasswordNoController.dispose();
    verificationCodeController.dispose();
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
          toolbarHeight: 100.h,
          title: const Text('Sign Up'),
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
              Navigator.pushReplacementNamed(context, RoutesName.selectUser);
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
                  height: 100.h,
                ),
                Expanded(
                  child: Container(
                    width: 430.w,
                    padding: EdgeInsets.symmetric(horizontal: 5.r),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: 50,
                        top: 50,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ////////////////////////////

                          SizedBox(
                            height: 50.h,
                            width: 380.w,
                            child: TextFormField(
                              maxLength: 50,
                              controller: usernameController,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black87),
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.grey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  //isDense: true,
                                  //counter: SizedBox.shrink(),
                                  // helperText: "",

                                  // prefixIcon: const Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffe0c47d),
                                  // ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffe0c47d)),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffe0c47d)),
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
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: const Color(0xFF808080)
                                            .withOpacity(0.8),
                                      )),
                              SizedBox(
                                height: 60,
                                child: TextFormField(
                                  maxLength: 50,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.black87),
                                  decoration: const InputDecoration(
                                      //isDense: true,
                                      counter: SizedBox.shrink(),
                                      contentPadding: EdgeInsets.all(10),
                                      // prefixIcon: const Icon(
                                      //   Icons.email_outlined,
                                      //   color: Color(0xffe0c47d),
                                      // ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe0c47d)),
                                        //borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe0c47d)),
                                        //borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                      // hintText: "Email or Phone number:",
                                      // hintStyle: Theme.of(context)
                                      //     .textTheme
                                      //     .bodyMedium
                                      //     ?.copyWith(color: Colors.grey.shade300),
                                      // labelText: "Enter your password",
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true),
                                ),
                              )
                            ],
                          ),
                          Container(
                            // height:
                            //     context.read<ScreenUtil>().screenHeightDp! * 0.1,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
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
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  errorStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.red),
                                  hintText: "Enter your number",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.grey.shade300),

                                  // labelText: "Enter your password",
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  fillColor: Colors.white,
                                  filled: true),
                              spaceBetweenSelectorAndTextField: 5,
                              hintText: "Enter phone number",
                              onInputChanged: (PhoneNumber number) {
                                formkey.currentState!.validate();

                                dialcode = number.dialCode!;
                                this.number = number;

                                //
                                //
                              },
                              onInputValidated: (bool value) {
                                //
                              },
                              selectorConfig: const SelectorConfig(
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
                              textFieldController: phonenumbercontroller,
                              formatInput: false,
                              keyboardType: TextInputType.phone,
                              inputBorder: InputBorder.none,
                              onSaved: (PhoneNumber number) {
                                //
                              },
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          SizedBox(
                            height: 60,
                            child: TextFormField(
                              maxLength: 20,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black87),
                              decoration: InputDecoration(
                                  //isDense: true,
                                  contentPadding: const EdgeInsets.all(10),
                                  counter: const SizedBox.shrink(),
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
                                  // prefixIcon: const Icon(
                                  //   Icons.email_outlined,
                                  //   color: Color(0xffe0c47d),
                                  // ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffe0c47d)),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xffe0c47d)),
                                    //borderRadius: BorderRadius.all(Radius.circular(40))
                                  ),
                                  // hintText: "Email or Phone number:",
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyMedium
                                  //     ?.copyWith(color: Colors.grey.shade300),
                                  // labelText: "Enter your password",
                                  border: const OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //confirm password
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Confirm Password:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: const Color(0xFF808080)
                                            .withOpacity(0.8),
                                      )),
                              SizedBox(
                                height: 60,
                                child: TextFormField(
                                  maxLength: 20,
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.black87),
                                  decoration: InputDecoration(
                                      // isDense: true,
                                      contentPadding: const EdgeInsets.all(10),
                                      counter: const SizedBox.shrink(),
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
                                      // prefixIcon: const Icon(
                                      //   Icons.email_outlined,
                                      //   color: Color(0xffe0c47d),
                                      // ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe0c47d)),
                                        //borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xffe0c47d)),
                                        //borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                      // hintText: "Email or Phone number:",
                                      // hintStyle: Theme.of(context)
                                      //     .textTheme
                                      //     .bodyMedium
                                      //     ?.copyWith(color: Colors.grey.shade300),
                                      // labelText: "Enter your password",
                                      border: const OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true),
                                ),
                              )
                            ],
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
                          // CustomButton(
                          //     buttonname: "Sign Up",
                          //     textcolor: Colors.white,
                          //     color: MyColors.lightgolden,
                          //     noDividers: true,
                          //     callback: () async {
                          //       if (!formkey.currentState!.validate()) {
                          //         return;
                          //       }
                          //       // var result = FirebaseAuthService()
                          //       //     .signinWithEmailAndPassword(
                          //       //         email: emailController.text.trim(),
                          //       //         password: passwordNoController.text.trim());
                          //     }),

                          const SizedBox(
                            height: 20,
                          ),

                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have a account? ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: const Color(0xFF808080)
                                            .withOpacity(0.5),
                                      ),
                                ),
                                TextButton(
                                  onPressed: (() {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => const Signin()));
                                  }),
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(80, 30),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      alignment: Alignment.center),
                                  child: Text(
                                    "Sign In Now",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          color: Colors.blue.shade200,
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
                )
              ],
            )),
      ),
    );
  }
}
