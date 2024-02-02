// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:door_shark/utils/routes/routes.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserSelection> {
  List<String> scrollimages = [
    "assets/images/getStart.png",
    "assets/images/getStart.png",
    "assets/images/getStart.png"
  ];
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: Column(
          children: [
            SizedBox(height: 100.h),
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 318.h,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentindex = index;
                  });
                },
              ),
              itemCount: scrollimages.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                          child: Container(
                width: 380.w,
                height: 318.h, // Adjust width based on your design
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r), // Rounded corners
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
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      scrollimages[itemIndex],
                      height: 318.h,
                      width: 322.w,
                      //fit: BoxFit.contain,
                    ),
                  ),
                ),
              )),
            ),
            SizedBox(
              height: 10.h,
            ),
            DotsIndicator(
              dotsCount: scrollimages.length,
              position: currentindex,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white, // Inactive color
                activeColor: Colors.blue,
              ),
            ),
            SizedBox(height: 100.h),
            Expanded(
              child: Container(
                height: 409.h,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: 380.w,
                      height: 50.h, // Adjust the width based on your design
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed("/2ndscreen");
                          Navigator.pushNamed(
                              context, RoutesName.customerSignUp);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.blue.shade900, // Button text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.r), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                          ), // Button padding
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Join as Customer',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                              const Icon(Icons.person_2_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Adjust the space as needed
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 380.w,
                      height: 50.h, // Adjust the width based on your design
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pushNamed("/2ndscreen");
                          Navigator.pushNamed(
                              context, RoutesName.contractorSignUp);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue.shade900,
                          backgroundColor: Colors.white, // Button text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.r), // Rounded corners
                          ),
                          side: BorderSide(color: Colors.blue.shade900),
                          padding: EdgeInsets.symmetric(
                            vertical: 1.h,
                          ), // Button padding
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Join as Contractor',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w300),
                              ),
                              const Icon(Icons.person_sharp)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(), // Use Spacer for better control of the spacing
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
