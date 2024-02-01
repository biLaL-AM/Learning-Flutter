// ignore_for_file: file_names

import 'package:door_shark/utils/routes/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContractorSignUp extends StatefulWidget {
  const ContractorSignUp({super.key});

  @override
  State<ContractorSignUp> createState() => _ContractorSignUpState();
}

class _ContractorSignUpState extends State<ContractorSignUp> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _catorgoryOfWorkController =
      TextEditingController();
  final TextEditingController _workExperience = TextEditingController();

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
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [],
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
