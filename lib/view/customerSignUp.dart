import 'package:door_shark/utils/routes/routes.dart';
import 'package:door_shark/utils/widgets/textField.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({super.key});

  @override
  State<CustomerSignUp> createState() => _SignUpState();
}

class _SignUpState extends State<CustomerSignUp> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _primaryAddress = TextEditingController();
  final TextEditingController _secondaryAddress = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          toolbarHeight: 10.h,
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
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: const BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h),
                          // Text(
                          //   'Create an Account',
                          //   style: TextStyle(
                          //     fontFamily: 'Montserrat',
                          //     color: Colors.black,
                          //     fontSize: 20.sp,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          TextFieldWidget(
                            fillColor: Colors.white,
                            filled: true,
                            textInputType: TextInputType.name,
                            controller: _nameController,
                            hintText: 'Name',
                          ),
                          SizedBox(height: 1.5.h),
                          TextFieldWidget(
                            fillColor: Colors.white,
                            filled: true,
                            textInputType: TextInputType.emailAddress,
                            controller: _emailController,
                            hintText: 'Email',
                          ),
                          SizedBox(height: 1.5.h),
                          TextFieldWidget(
                            fillColor: Colors.white,
                            filled: true,
                            controller: _phoneNumberController,
                            hintText: 'Phone Number',
                          ),
                          SizedBox(height: 1.5.h),
                          ValueListenableBuilder(
                              valueListenable: _obscurePassword,
                              builder: (context, value, child) {
                                return TextFieldWidget(
                                  fillColor: Colors.white,
                                  filled: true,
                                  controller: _passwordController,
                                  obscureText: true,
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined),
                                    onPressed: () {
                                      _obscurePassword.value =
                                          !_obscurePassword.value;
                                    },
                                  ),
                                  textInputType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can't be empty";
                                    } else if (value.length < 6) {
                                      return "Password must be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                );
                              }),
                          SizedBox(height: 1.5.h),
                          ValueListenableBuilder(
                              valueListenable: _obscurePassword,
                              builder: (context, value, child) {
                                return TextFieldWidget(
                                  fillColor: Colors.white,
                                  filled: true,
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  hintText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(value
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined),
                                    onPressed: () {
                                      _obscurePassword.value =
                                          !_obscurePassword.value;
                                    },
                                  ),
                                  textInputType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password can't be empty";
                                    } else if (value.length < 6) {
                                      return "Password must be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                );
                              }),
                          SizedBox(height: 1.5.h),
                          TextFieldWidget(
                            fillColor: Colors.white,
                            filled: true,
                            textInputType: TextInputType.streetAddress,
                            controller: _primaryAddress,
                            hintText: 'Primary Address',
                          ),
                          SizedBox(height: 1.5.h),
                          TextFieldWidget(
                            fillColor: Colors.white,
                            filled: true,
                            textInputType: TextInputType.streetAddress,
                            controller: _secondaryAddress,
                            hintText: 'Secondary Adress',
                          ),
                          SizedBox(height: 1.5.h),
                          SizedBox(
                            width: 90.w,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Process data.
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade900,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.w),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.h,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 4),
                                child: Text(
                                  'Proceed',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Container(
                            alignment: Alignment.center,
                            child: Text.rich(TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.sp,
                                ),
                                children: [
                                  TextSpan(
                                      text: "Login",
                                      style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.sp,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            Navigator.pushReplacementNamed(
                                                context,
                                                RoutesName.getStarted)),
                                ])),
                          ),
                          SizedBox(height: 2.h),
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
