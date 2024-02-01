import 'package:door_shark/utils/routes/route_name.dart';
import 'package:door_shark/utils/routes/routes.dart';
import 'package:door_shark/view/userSelection.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'view/getStarted.dart'; // Adjust the import path to your file structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Door Shark',
          theme: ThemeData(
              // Customize your app's theme here
              ),
          // routes: {
          //   "/":(context) => const GetStartedView()
          //   // ,"/2ndscreen" : (context)=> const MyWidget()
          // },
          initialRoute: RoutesName.getStarted,
          onGenerateRoute:
              Routes.generateRoutes, // Set GetStartedView as the initial screen
        );
      },
    );
  }
}
