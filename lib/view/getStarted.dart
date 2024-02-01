import 'package:door_shark/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: Column(
          children: [
            SizedBox(height: 3.h),
            Expanded(
              child: Container(
                width: 70.w, // Adjust width based on your design
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.w), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.w, // Shadow blur radius
                      offset: Offset(0, 2.w), // Shadow position
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      3.w), // Clip it with rounded corners
                  child: Image.asset(
                    'assets/images/getStart.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text(
                      'Discover Your Work & Workers Here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.h), // Adjust the space as needed
                    SizedBox(
                      width: 70.w, // Adjust the width based on your design
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed("/2ndscreen");
                          Navigator.pushReplacementNamed(
                              context, RoutesName.selectUser);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.blue.shade900, // Button text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(7.w), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                          ), // Button padding
                        ),
                        child: Text(
                          'Get Start',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Spacer(), // Use Spacer for better control of the spacing
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
