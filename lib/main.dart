import 'package:door_shark/utils/routes/route_name.dart';
import 'package:door_shark/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
  //     overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     systemStatusBarContrastEnforced: true,
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarDividerColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.light,
  //     statusBarIconBrightness: Brightness.light));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Door Shark',
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  //backgroundColor: Colors.transparent
                  // systemOverlayStyle: SystemUiOverlayStyle(
                  //   statusBarColor: Colors.blue.shade900, // <-- SEE HERE
                  //   statusBarIconBrightness:
                  //       Brightness.dark, //<-- For Android SEE HERE (dark icons)
                  //   statusBarBrightness:
                  //       Brightness.dark, //<-- For iOS SEE HERE (dark icons)
                  // ),
                  )
              // Customize your app's theme here
              ),

          initialRoute: RoutesName.getStarted,
          onGenerateRoute:
              Routes.generateRoutes, // Set GetStartedView as the initial screen
        );
      },
    );
  }
}
