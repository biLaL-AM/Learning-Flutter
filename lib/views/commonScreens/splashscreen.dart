import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:door_shark/utils/routes/routes.dart';
import 'package:door_shark/views/commonScreens/getStarted.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSplashScreen.withScreenFunction(
          duration: 1000, //2500, //3000,

          backgroundColor: Colors.black,
          centered: false,
          splashIconSize: MediaQuery.of(context).size.longestSide,
          splashTransition: SplashTransition.fadeTransition,
          animationDuration: const Duration(milliseconds: 1000),
          pageTransitionType: PageTransitionType.fade,
          splash: SizedBox(
            height: double.infinity,
            child: Stack(children: [
              SizedBox(
                  // height: 932.h,
                  width: double.infinity,
                  child: Image.asset("assets/images/gradientback.png")),
              Center(child: Image.asset("assets/images/logo.png"))
            ]),
          ),
          screenFunction: () async {
            return const GetStartedView();
          }),
    );
  }
}
// ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                       3.w), // Clip it with rounded corners
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Image.asset(
//                       scrollimages[itemIndex],
//                       height: 318.h,
//                       width: 322.w,
//                       //fit: BoxFit.contain,
//                     ),
//                   ),
//                 )