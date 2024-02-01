import 'package:door_shark/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 5.h,
          ),
          Container(
            width: 85.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(3), // Clip it with rounded corners
              child: Image.asset(
                'assets/images/getStart.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 4.h),
                  SizedBox(
                    width: 90.w, // Adjust the width based on your design
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.customerSignUp);
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Join as Customer',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12.sp,
                              ),
                            ),
                            Icon(Icons.supervised_user_circle_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h), // Adjust the space as needed
                  SizedBox(
                    width: 90.w, // Adjust the width based on your design
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.contractorSignUp);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        // Button text colorside
                        side: BorderSide(color: Color(0xFF054FB9)),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(7.w), // Rounded corners
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 1.h,
                        ), // Button padding
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Join as Contractor',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.sp,
                                  color: Color(0xFF054FB9)),
                            ),
                            Icon(
                              Icons.supervised_user_circle_outlined,
                              color: Color(0xFF054FB9),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(), // Use Spacer for better control of the spacing
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
