// ignore_for_file: unused_import

// import 'package:device_preview/device_preview.dart';
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/root/app_route.dart';
import 'package:first_app/core/root/on_genrate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
      // DevicePreview(
      //   builder: (context) {
      // return

      const MyApp()
      // },
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardColor: AppColor.splashColor,
          
          scaffoldBackgroundColor: AppColor.splashColor,
          colorScheme:
              ColorScheme.fromSeed(seedColor: AppColor.priomaryColorApp),
          useMaterial3: true,
        ),
        initialRoute: AppRoot.splash,
        onGenerateRoute: OnGenerateRoot.onGenerateRoute,
      ),
    );
  }
}
