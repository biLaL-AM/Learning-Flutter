// //add material lib
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:iotapp/res/components/round_button.dart';
// import 'package:iotapp/theme/palette.dart';
// import 'package:iotapp/utils/routes/routes_name.dart';
// import 'package:iotapp/utils/utils.dart';
// import 'package:iotapp/utils/widgets/textfield.dart';
// import 'package:iotapp/view_model/auth_provider.dart';
// import 'package:iotapp/view_model/theme_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:sizer/sizer.dart';

// class SignUpView extends StatefulWidget {
//   const SignUpView({super.key});

//   @override
//   State<SignUpView> createState() => _SignUpViewState();
// }

// class _SignUpViewState extends State<SignUpView> {
//   final isLoading = ValueNotifier<bool>(false);
//   final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   final _formKey = GlobalKey<FormState>();

//   // final FocusNode _emailFocusNode = FocusNode();
//   // final FocusNode _passwordFocusNode = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height * 1;
//     final currentTheme = Provider.of<ThemeNotifier>(context);
//     final authViewModel = Provider.of<AuthViewModel>(context);
//     return SafeArea(
//       child: Scaffold(
//         // backgroundColor: Pallete.primaryColor,
//         backgroundColor: currentTheme.themeData.canvasColor,
//         appBar: AppBar(
//           backgroundColor: currentTheme.themeData.canvasColor,
//           //remove shadow
//           elevation: 0,
//           leadingWidth: 100.w,
//           leading: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 width: 5.w,
//               ),
//               Consumer<ThemeNotifier>(
//                 builder: (context, notifier, child) {
//                   return FlutterSwitch(
//                     width: 20.w,
//                     height: 5.h,
//                     toggleSize: 5.h,
//                     valueFontSize: 12.sp,
//                     borderRadius: 30.0,
//                     padding: 5.0,
//                     value: notifier.mode == CustomThemeMode.dark,
//                     activeToggleColor: currentTheme.themeData.iconTheme.color,
//                     inactiveToggleColor: Pallete.primaryColor,
//                     activeSwitchBorder: Border.all(
//                       color: Pallete.blackColor,
//                     ),
//                     inactiveSwitchBorder: Border.all(
//                       color: Pallete.primaryColor,
//                     ),
//                     activeColor: Pallete.greyColor,
//                     inactiveColor: Pallete.whiteColor,
//                     activeIcon: Icon(
//                       Icons.nightlight_outlined,
//                       color: currentTheme.themeData.colorScheme.background,
//                     ),
//                     inactiveIcon: Icon(
//                       Icons.wb_sunny,
//                       color: currentTheme.cardColor,
//                     ),
//                     showOnOff: false,
//                     onToggle: (value) {
//                       notifier.toggleTheme();
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//         body: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 2.h,
//               ),
//               SvgPicture.asset(
//                 "assets/images/svg/dlogo.svg",
//                 height: 15.h,
//                 width: 15.w,
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 6.w),
//                   decoration: BoxDecoration(
//                     color: currentTheme.themeData.colorScheme.brightness ==
//                             Brightness.light
//                         ? Pallete.whiteColor
//                         : Pallete.drawerColor,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20),
//                     ),
//                   ),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Container(
//                             margin: EdgeInsets.symmetric(vertical: 1.0.h),
//                             alignment: Alignment.centerRight,
//                             height: 4.0.h,
//                             child: GestureDetector(
//                               child: SvgPicture.asset(
//                                 "assets/images/svg/cross_icon.svg",
//                                 color: currentTheme
//                                     .themeData.colorScheme.onBackground,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Sign Up",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20.0.sp,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           "Please enter your correct details below for \nsigning-up",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 15.0.sp,
//                             fontWeight: FontWeight.w400,
//                             color: Pallete.greyColor,
//                           ),
//                         ),
//                         SizedBox(
//                           height: height * 0.05,
//                         ),

//                         TextFieldWidget(
//                           controller: _emailController,
//                           hintText: "Email",
//                           textInputType: TextInputType.emailAddress,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Email cannot be empty";
//                             } else if (!RegExp(
//                                     "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                                 .hasMatch(value)) {
//                               return "Please enter a valid email";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: height * 0.005,
//                         ),
//                         ValueListenableBuilder(
//                             valueListenable: _obscurePassword,
//                             builder: (context, value, child) {
//                               return TextFieldWidget(
//                                 controller: _passwordController,
//                                 obscureText: true,
//                                 hintText: "Password",
//                                 // suffixIcon: IconButton(
//                                 //   icon: Icon(value
//                                 //       ? Icons.visibility_off_outlined
//                                 //       : Icons.visibility_outlined),
//                                 //   onPressed: () {
//                                 //     _obscurePassword.value =
//                                 //         !_obscurePassword.value;
//                                 //   },
//                                 // ),
//                                 textInputType: TextInputType.visiblePassword,
//                                 validator: (value) {
//                                   if (value!.isEmpty) {
//                                     return "Password cannot be empty";
//                                   } else if (value.length < 8) {
//                                     return "Password lenght should be altleast 8";
//                                   }
//                                   return null;
//                                 },
//                               );

//                               // return TextFormField(
//                               //   controller: _passwordController,
//                               //   obscureText: value,
//                               //   obscuringCharacter: "*",
//                               //   decoration: InputDecoration(
//                               //     hintText: "Enter Your Password",
//                               //     labelText: "Password",
//                               //     prefixIcon:
//                               //         const Icon(Icons.lock_open_outlined),
//                               //     suffixIcon: IconButton(
//                               //       icon: Icon(value
//                               //           ? Icons.visibility_off_outlined
//                               //           : Icons.visibility_outlined),
//                               //       onPressed: () {
//                               //         _obscurePassword.value =
//                               //             !_obscurePassword.value;
//                               //       },
//                               //     ),
//                               //     border: const OutlineInputBorder(),
//                               //   ),
//                               //   //focus field is not working
//                               //   onFieldSubmitted: (value) {
//                               //     Utils.fieldFocusChange(context,
//                               //         _passwordFocusNode, _passwordFocusNode);
//                               //     // _emailFocusNode.unfocus();
//                               //     // FocusScope.of(context).requestFocus(_passwordFocusNode);
//                               //   },
//                               // );
//                             }),
//                         SizedBox(
//                           height: height * 0.005,
//                         ),
//                         TextFieldWidget(
//                           controller: _confirmPasswordController,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return "Confirm Password cannot be empty";
//                             } else if (value != _passwordController.text) {
//                               return "Password must be same as above";
//                             } else if (value.length < 8) {
//                               return "Password lenght should be altleast 8";
//                             }
//                             return null;
//                           },
//                           obscureText: true,
//                           hintText: "Re-Password",
//                           textInputType: TextInputType.visiblePassword,
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         RoundButton(
//                           title: "Sign Up",
//                           loading: authViewModel.signupLoading,
//                           onPressed: () {
//                             if (_emailController.text.isEmpty) {
//                               Utils.flushBarErrorMessage(
//                                   context, "Email is Empty");
//                               // Utils.toastMessage("Email is Empty");
//                             } else if (_passwordController.text.isEmpty) {
//                               Utils.flushBarErrorMessage(
//                                   context, "Password is Empty");
//                             } else if (_passwordController.text.length < 5) {
//                               Utils.flushBarErrorMessage(context,
//                                   "Password must be at least 5 characters");
//                             } else if (_confirmPasswordController.text !=
//                                 _passwordController.text) {
//                               Utils.flushBarErrorMessage(
//                                   context, "Password must be same");
//                             } else {
//                               Map data = {
//                                 "email": _emailController.text.toString(),
//                                 "password": _passwordController.text.toString()
//                               };
//                               //calling API here
//                               authViewModel.signUpApi(data, context);

//                               // print("Sign Up Successfull");
//                             }
//                             // Navigator.pushNamed(context, RoutesName.home);
//                           },
//                         ),
//                         SizedBox(
//                           height: 2.h,
//                         ),
//                         // InkWell(
//                         //     onTap: () {
//                         //       Navigator.pushNamed(context, RoutesName.login);
//                         //     },
//                         //     child: Text("Already have an account? Login")),
//                         Container(
//                           alignment: Alignment.center,
//                           child: Text.rich(
//                             TextSpan(
//                               text: "Already have an account? ",
//                               style: TextStyle(
//                                 fontSize: 16.0.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: "Login",
//                                   style: TextStyle(
//                                     fontSize: 16.0.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: Pallete.primaryColor,
//                                   ),
//                                   recognizer: TapGestureRecognizer()
//                                     ..onTap = () =>
//                                         Navigator.pushReplacementNamed(
//                                             context, RoutesName.login),

//                                   // Routemaster.of(context).push('/'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
