import 'package:door_shark/utils/routes/routes.dart';
import 'package:door_shark/view/contractorSignUp.dart';
import 'package:door_shark/view/customerSignUp.dart';
import 'package:door_shark/view/userSelection.dart';
import 'package:door_shark/view/getStarted.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
