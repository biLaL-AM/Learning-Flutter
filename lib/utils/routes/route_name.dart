import 'package:door_shark/utils/routes/routes.dart';
import 'package:door_shark/views/commonScreens/getStarted.dart';
import 'package:door_shark/views/commonScreens/splashscreen.dart';
import 'package:door_shark/views/commonScreens/userSelection.dart';
import 'package:door_shark/views/contractorScreens/contractorSignUp.dart';
import 'package:door_shark/views/customerScreens/customerSignUp.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.getStarted:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GetStartedView());
      case RoutesName.selectUser:
        return MaterialPageRoute(
            builder: (BuildContext context) => const UserSelection());
      case RoutesName.customerSignUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CustomerSignUp());
      case RoutesName.contractorSignUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ContractorSignUp());
        case RoutesName.splashscreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route is defined for"),
            ),
          );
        });
    }
  }
}
