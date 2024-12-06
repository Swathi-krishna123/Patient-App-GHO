import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Text(
              'No notifications yet',
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
