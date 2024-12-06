import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;
import 'package:flutter/services.dart';

// import 'package:pedometer/pedometer.dart';
import '../util/routes.dart';
import '../util/shared_prefences.dart';

class AppController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadBioEnabledPreference();
  }

  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<String> selectedTimeSlot = ''.obs;
  var isNavigating = false.obs;
  var genderappointment = false.obs;
  Rx<bool> isBioEnabled = false.obs;

  Future<void> loadBioEnabledPreference() async {
    // Retrieve the stored value and assign it to isBioEnabled
    bool? storedValue =
        await SharedPrefs.getBool(SharedPrefs.ISBIOMETRICENABLED);
    isBioEnabled.value = storedValue ?? false; // Default to false if null
  }

  final Map<String, String> fileExtensionIcons = {
    'txt': 'assets/icons/txt.svg',
    'pdf': 'assets/icons/pdf.svg',
    'jpg': 'assets/icons/jpg.svg',
    'jpeg': 'assets/icons/jpeg.svg',
    'png': 'assets/icons/png.svg',
    'dicom': 'assets/icons/dicom.svg',
    'docx': 'assets/icons/doc.svg'
  };

  splashcheck(LocalAuthentication localAuthentication) async {
    if (!isNavigating.value) {
      isNavigating.value = true;
      var userToken = await SharedPrefs.getString(SharedPrefs.TOKEN);
      var isBioEnabled =
          await SharedPrefs.getBool(SharedPrefs.ISBIOMETRICENABLED) ?? false;
      if (userToken != null) {
        if (!Get.isRegistered<AppUserController>()) {
          Get.lazyPut<AppUserController>(() => AppUserController());
        }
        final AppUserController controller = Get.find<AppUserController>();
        bool userDetailsSuccess = await controller.getUserDetails();
        if (isBioEnabled) {
          bool isAuthorized = await authenticateUser(localAuthentication);
          if (userDetailsSuccess && isAuthorized) {
            Get.offAllNamed(PageRouteName.mainpage);
          } else {
            await showLockedDialog(localAuthentication);
          }
        } else {
          if (userDetailsSuccess) {
            Get.offAllNamed(PageRouteName.mainpage);
          } else {
            Get.offAllNamed(PageRouteName.splashDiologue);
          }
        }
      } else {
        Get.offAllNamed(PageRouteName.splashDiologue);
      }
    }
  }

  authenticateUser(LocalAuthentication localAuthentication) async {
    bool isAuthorized = false;
    try {
      isAuthorized = await localAuthentication.authenticate(
        localizedReason: "Please authenticate to proceed",
        options: const AuthenticationOptions(
            biometricOnly: false, useErrorDialogs: true, stickyAuth: false),
      );
    } on PlatformException catch (exception) {
      if (exception.code == local_auth_error.notAvailable ||
          exception.code == local_auth_error.passcodeNotSet ||
          exception.code == local_auth_error.notEnrolled) {
        return false;
      }
    }

    if (isAuthorized) {
      return true;
    } else {
      return false;
    }
  }

  void changeGenderAppointment(bool value) {
    genderappointment.value = value;
  }

  Future<void> showLockedDialog(LocalAuthentication localAuthentication) async {
    await Get.dialog(
      AlertDialog(
        icon: Icon(Icons.lock_outline_rounded,
            color: AppUtil().textcolor, size: 24),
        title: Text("Global Health Opinion is locked"),
        content: Text(
            "For your security, you can only use Global Health Opinion when it's unlocked or you can login again."),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed(
                  PageRouteName.splashDiologue); // Navigate to login screen
            },
            child: Text(
              "Login Again",
              style: TextStyle(color: AppUtil().textcolor),
            ),
          ),
          TextButton(
            onPressed: () async {
              bool isAuthorized = await authenticateUser(localAuthentication);
              if (isAuthorized) {
                Get.offAllNamed(PageRouteName.mainpage);
              }
            },
            child: Text(
              "Unlock",
              style: TextStyle(color: AppUtil().textcolor),
            ),
          ),
        ],
      ),
      barrierDismissible: false, // Prevent dialog dismissal on outside tap
    );
  }
}
