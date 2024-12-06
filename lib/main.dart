import 'dart:developer';
import 'dart:io';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/foundation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
import 'package:global_health_opinion_sample/views/splash_view/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_update/in_app_update.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Stripe.publishableKey =
      'pk_test_51Q4g5OP5uFcSVUBqvIGbbygiBNXdKXyl5gio9RlkHtv5rMYNv5cV6r3xSBqOrWHMivh07TehNa5Jc2zLIb669Jcg004m0Zfceg';
  runApp(const MyApp());
  // runApp(DevicePreview(
  //   builder: (context) => MyApp(),
  // ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(462, 1005),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              navigatorObservers: <NavigatorObserver>[observer],
              useInheritedMediaQuery: true,
              // locale: DevicePreview.locale(context),
              // builder: (context, widget) {
              //   widget = DevicePreview.appBuilder(
              //       context, widget); // Ensure it's inside the builder
              //   return widget;
              // },
              initialBinding: BindingsBuilder(
                () {
                  Get.put(AppUserController());
                  Get.put(AppController());
                },
              ),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  useMaterial3: true,
                  primarySwatch: Colors.blue,
                  fontFamily: GoogleFonts.lato().fontFamily),
              home: AppUpdater(),
              getPages: getPagesroutes);
        });
  }
}

class AppUpdater extends StatefulWidget {
  const AppUpdater({super.key});

  @override
  State<AppUpdater> createState() => _AppUpdaterState();
}

class _AppUpdaterState extends State<AppUpdater> {
  Future<void> _checkForUpdate() async {
    log('Checking For Update');
    try {
      final isUpdateAvailable = await InAppUpdate.checkForUpdate();
      if (isUpdateAvailable.updateAvailability ==
          UpdateAvailability.updateAvailable) {
        await InAppUpdate.startFlexibleUpdate();
        await InAppUpdate.completeFlexibleUpdate();
      }
    } catch (e) {
      log('Error while checking for update: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      _checkForUpdate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
