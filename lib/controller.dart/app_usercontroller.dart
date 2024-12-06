import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/models/usermodel/usermodel.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/dio_handler.dart';

import '../util/routes.dart';
import '../util/shared_prefences.dart';

class AppUserController extends GetxController {
  Rx<bool> loginpassobscureText = true.obs;
  Rx<bool> registerpassobscureText = true.obs;
  Rx<bool> registerconfirmpassobscureText = true.obs;
  Rx<bool> currentpassobscureText = true.obs;
  Rx<bool> newpasspassobscureText = true.obs;
  Rx<bool> newconfirmpassobscureText = true.obs;
  int? responsestatus;
  String email = '';
  String password = '';
  String data = '';
  String tokenMsg = '';
  Rx<bool> isLoading = false.obs;
  Rx<bool> isChecked = false.obs;
  RxString checkboxError = ''.obs;
  Rx<bool> resetPasswordobscureText = true.obs;
  Rx<bool> resetPasswordConfirmobscureText = true.obs;
  Rx<String> combinedPhonenumber = ''.obs;
  String? token;
  static const int otpValidityDuration = 15 * 60; // 15 minutes in seconds
  var remainingSeconds = otpValidityDuration.obs; // Observable variable
  Timer? timer;
  String? countryId = '+91';

  void startTimer() {
    timer?.cancel();

    remainingSeconds.value = otpValidityDuration;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        remainingSeconds.value = 0;
        timer.cancel();
      }
    });
  }

  String formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  changePassword({String? currentPassword, String? newPassword}) async {
    var userToken = await SharedPrefs.getString(SharedPrefs.TOKEN);
    var body = {
      "Token": userToken,
      "Tags": [
        {"T": "Action", "V": "CHPWD"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": currentPassword},
        {"T": "dk2", "V": newPassword},
      ]
    };

    String jsonBody = jsonEncode(body);
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    var responsestatus = response['Status'];
    if (responsestatus == 1) {
      log(response.toString());
      data = response['Info'];
      return true;
    } else {
      log('Response Status: $responsestatus');
      return false;
    }
  }

  forgetPassword(
      {String? email,
      String? password,
      String? confirmPassword,
      String? token}) async {
    var body = {
      "Token": token,
      "Tags": [
        {"T": "Action", "V": "PWDRECOVERY"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": password},
      ]
    };

    String jsonBody = jsonEncode(body);
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    var responsestatus = response['Status'];
    var responsedata = response['Data'];
    if (responsestatus == 1) {
      debugPrint(responsedata.toString());
      return true;
    } else {
      log('Response Status: $responsestatus');
      return false;
    }
  }

  logoutCheck() async {
    SharedPrefs.clearStorage();
    var userToken = await SharedPrefs.getString(SharedPrefs.TOKEN);
    if (userToken != null) {
      Get.offAllNamed(PageRouteName.homepage);
    } else {
      Get.offAllNamed(PageRouteName.login);
      update();
    }
  }

  userRegistration(
    String firstname,
    String lastname,
    String email,
    String password,
    String phone,
  ) async {
    isLoading.value = true;
    var body = {
      "Token": "",
      "Tags": [
        {"T": "Action", "V": "SIGNUP"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": firstname},
        {"T": "dk2", "V": lastname},
        {"T": "c1", "V": email},
        {"T": "c2", "V": password},
        {"T": "c3", "V": countryId},
        {"T": "c4", "V": phone},
        {"T": "c10", "V": "3"}
      ]
    };

    // Encode body as JSON string
    String jsonBody = jsonEncode(body);

    // Print the encoded JSON body
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    responsestatus = response['Status'];
    if (responsestatus == 1) {
      log("Sigin ${response.toString()}");
      print('values $responsestatus');
      log(response.toString());
      data = response['Info'];
      isLoading.value = false;
    } else {
      log("Sigin ${response.toString()}");
      isLoading.value = false;
      data = response['Info'];
      print(data);
      log(response.toString());
    }

    return responsestatus;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    String pattern = r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  userOTPConfirmation(String email, String otp, BuildContext context,
      String destination) async {
    var body = {
      "Token": "",
      "Tags": [
        {"T": "Action", "V": "OTP"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": email},
        {"T": "dk2", "V": otp},
        {"T": "c10", "V": "2"},
      ]
    };

    String jsonBody = jsonEncode(body);
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    var responsestatus = response['Status'];
    var responsedata = response['Data'];

    if (responsestatus == 1) {
      if (responsedata != null && responsedata.isNotEmpty) {
        var firstElement = responsedata[0];
        if (firstElement.isNotEmpty && firstElement[0].containsKey('tkn')) {
          if (destination == 'Login') {
            String token = firstElement[0]['tkn'];
            SharedPrefs.setString(token, SharedPrefs.TOKEN);
            return true;
          } else {
            token = firstElement[0]['tkn'];
            return true;
          }
        } else {
          log('The response data does not contain a "tkn" key or is empty.');
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context)
              .showSnackBar(CommonWidgets().snackBarinfo('Invalid OTP'));
          return false;
        }
      } else {
        log('The response data is null or empty.');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(CommonWidgets().snackBarinfo('Invalid OTP'));
        return false;
      }
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(CommonWidgets().snackBarinfo('Invalid OTP'));
      log('Response Status: $responsestatus');
      return false;
    }
  }

  userSignIN(
    String email,
    String password,
  ) async {
    isLoading.value = true;
    var body = {
      "Token": "",
      "Tags": [
        {"T": "Action", "V": "SIGNIN"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": email},
        {"T": "dk2", "V": password},
        {"T": "c10", "V": "1"},
      ]
    };

    // Encode body as JSON string
    String jsonBody = jsonEncode(body);

    // Print the encoded JSON body
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    responsestatus = response['Status'];
    if (responsestatus == 1) {
      log("Sigin ${response.toString()}");
      isLoading.value = false;
      data = response['Info'];
    } else if (responsestatus == 0) {
      log("Sigin ${response.toString()}");
      data = response['Info'];
      isLoading.value = false;
    }
    isLoading.value = false;
    return responsestatus;
  }

  newOTP(
    String email,
  ) async {
    var body = {
      "Token": "",
      "Tags": [
        {"T": "Action", "V": "NEWOTP"},
        {"T": "src", "V": "MOBILE"},
        {"T": "dk1", "V": email},
      ]
    };

    // Encode body as JSON string
    String jsonBody = jsonEncode(body);

    // Print the encoded JSON body
    log('Encoded Request Body: $jsonBody');

    var response = await DioHandler.dioPOST(body: jsonBody);
    var responsestatus = response['Status'];
    var responsedata = response['Data'];

    if (responsestatus == 1) {
      debugPrint(responsedata.toString());
      return true;
    } else {
      log('Response Status: $responsestatus');
      return false;
    }
  }

  var userDetailsResponse = Rxn<UserDetailsResponse>();
  var userDetail = Rxn<UserDetail>();

  getUserDetails() async {
    try {
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      if (token == null) {
        debugPrint("Error: Token is null");
        return false; // Return false to indicate failure
      }
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "PROFILE"},
          {"T": "src", "V": "MOBILE"},
        ]
      };
      String jsonBody = jsonEncode(body);
      var response = await DioHandler.dioPOST(body: jsonBody);
      if (response['Status'] == 1) {
        userDetailsResponse.value = UserDetailsResponse.fromJson(response);

        update();
        if (userDetailsResponse.value?.Data != null &&
            userDetailsResponse.value!.Data.isNotEmpty) {
          var userDetailMap =
              userDetailsResponse.value!.Data[0][0] as Map<String, dynamic>;
          userDetail.value = UserDetail.fromJson(userDetailMap);
          debugPrint(userDetail.value?.FirstName);
          log(userDetail.value.toString());
          update();
          return true; // Return true to indicate success
        } else {
          debugPrint("Error: No user details available in the response.");
          return false; // Return false to indicate failure
        }
      } else {
        debugPrint("Failed to fetch user details: ${response['Error']}");
        return false; // Return false to indicate failure
      }
    } catch (e, stacktrace) {
      debugPrint("An error occurred while fetching user details: $e");
      debugPrint("Stacktrace: $stacktrace");
      return false; // Return false to indicate failure
    }
  }

  updateUserDetails({
    String? firstname,
    String? lastname,
    String? email,
    String? phonenum,
  }) async {
    try {
      isLoading.value = true;
      String? token = await SharedPrefs.getString(SharedPrefs.TOKEN);
      debugPrint(
          "userdetails $firstname, $lastname, $email, $phonenum, $countryId");
      if (userDetail.value == null) {
        debugPrint("User detail is null");
        return; // Or handle this case appropriately
      }
      UserDetail updatedUserDetail = UserDetail(
          FirstName: firstname ?? userDetail.value?.FirstName,
          LastName: lastname ?? userDetail.value?.LastName,
          eMail: email ?? userDetail.value?.eMail,
          Phone: phonenum ?? userDetail.value?.Phone,
          Address1: userDetail.value?.Address1,
          City: userDetail.value?.City,
          CountryID: countryId ?? userDetail.value?.CountryID,
          DOB: userDetail.value?.DOB,
          Gendor: userDetail.value?.Gendor,
          State: userDetail.value?.State,
          ZipCode: userDetail.value?.ZipCode,
          Address2: userDetail.value?.Address2);
      var userDetailMap = updatedUserDetail.toJson();
      debugPrint("User Detail Map: $userDetailMap");

      // Encode to JSON string
      String profileBody = jsonEncode(userDetailMap);
      debugPrint("Profile Body: $profileBody");
      var body = {
        "Token": token,
        "Tags": [
          {"T": "Action", "V": "PROFILE"},
          {"T": "src", "V": "MOBILE"},
          {"T": "c1", "V": profileBody},
          {"T": "c10", "V": "2"}
        ]
      };
      String jsonBody = jsonEncode(body);
      debugPrint(jsonBody);
      var response = await DioHandler.dioPOST(body: jsonBody);

      if (response['Status'] == 1) {
        userDetailsResponse.value = UserDetailsResponse.fromJson(response);
        update();
        if (userDetailsResponse.value?.Data != null &&
            userDetailsResponse.value!.Data.isNotEmpty) {
          var userDetailMap =
              userDetailsResponse.value!.Data[0][0] as Map<String, dynamic>;
          userDetail.value = UserDetail.fromJson(userDetailMap);
          isLoading.value = false;
          update();
          isLoading.value = false;
          return true;
        } else {
          debugPrint("Error: No user details available in the response.");
          isLoading.value = false;
          return false;
        }
      } else {
        debugPrint("Failed to fetch user details: ${response['Error']}");
        isLoading.value = false;
        return false;
      }
    } catch (e, stacktrace) {
      isLoading.value = false;
      debugPrint("Exception $e");
      debugPrint("Stracktrace $stacktrace");
      return false;
    }
  }

  SnackBar snackBarinfo(String content) {
    return SnackBar(
      duration: Duration(seconds: 5),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppUtil().textcolor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            content,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
