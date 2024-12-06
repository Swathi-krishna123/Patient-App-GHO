import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:intl/intl.dart';

class AppUtil {
  Color containerColor = Color(0x4F4A97FD);
  Color lightGray = Color(0xFFF1F1F1);
  Color customBlue = Color(0xFF4A97FD);
  Color textcolor = Color(0xFF014EC4);
  Color backgroundcolor = Color(0xFFF5F8FE);
  SizedBox h10 = SizedBox(height: 10);
  SizedBox h15 = SizedBox(height: 15);
  SizedBox h5 = SizedBox(height: 5);

  static DateFormat formatter = DateFormat('dd MMM yyyy');
  final AppController controller = Get.put(AppController());

  Future<dynamic> logoutalert(BuildContext context) {
    Get.lazyPut(
      () => AppUserController(),
    );
    final AppUserController controller = Get.find();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      'Logout',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text('Are you sure you want to logout?',
                        style: TextStyle(
                          fontSize: 14,
                        )),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      logoutAlertButtons(() {
                        controller.logoutCheck();
                      }, 'Yes', AppUtil().textcolor, Colors.white),
                      const SizedBox(
                        width: 5,
                      ),
                      logoutAlertButtons(() => Navigator.pop(context), 'No',
                          Colors.grey.shade300, Colors.black),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  GestureDetector logoutAlertButtons(
      void Function()? onTap, String title, Color boxColor, Color textcolor) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 35,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 14, color: textcolor),
          ),
        ),
      ),
    );
  }

  List<String> countryfilter = [
    "+1", // United States
    "+971", // United Arab Emirates
    "+1", // Canada
    "+91", // India
    "+44", // United Kingdom
    "+65", // Singapore
    "+968", // Oman
    "+966", // Saudi Arabia
    "+965", // Kuwait
    "+52", // Mexico
    "+39", // Italy
    "+972", // Israel
    "+353", // Ireland
    "+852", // Hong Kong
    "+49", // Germany
    "+33", // France
    "+43", // Austria
    "+973", // Bahrain
    "+32", // Belgium
    "+55", // Brazil
    "+1", // British Virgin Islands
    "+238", // Cape Verde
    "+236", // Central African Republic
    "+57", // Colombia
    "+385", // Croatia
    "+53", // Cuba
    "+357", // Cyprus
    "+420", // Czech Republic
    "+45", // Denmark
    "+1", // Dominican Republic
    "+593", // Ecuador
    "+20", // Egypt
    "+503", // El Salvador
    "+358", // Finland
    "+30", // Greece
    "+299", // Greenland
    "+36", // Hungary
    "+354", // Iceland
    "+81", // Japan
    "+962", // Jordan
    "+254", // Kenya
    "+82", // Korea, South
    "+853", // Macau
    "+60", // Malaysia
    "+230", // Mauritius
    "+31", // Netherlands
    "+64", // New Zealand
    "+234", // Nigeria
    "+47", // Norway
    "+507", // Panama
    "+51", // Peru
    "+63", // Philippines
    "+48", // Poland
    "+351", // Portugal
    "+1", // Puerto Rico
    "+974", // Qatar
    "+7", // Russia
    "+27", // South Africa
    "+34", // Spain
    "+268", // Swaziland
    "+46", // Sweden
    "+90" // Turkey
  ];
}
