import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';

import '../../../controller.dart/app_usercontroller.dart';
import '../../../util/routes.dart';

class Forgetpasswordotp extends StatelessWidget {
  Forgetpasswordotp({super.key});
  final TextEditingController otpcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AppUserController controller = Get.put(AppUserController());

  @override
  Widget build(BuildContext context) {
    final defaultpintheme = PinTheme(
        width: 56.w,
        height: 60.h,
        textStyle: TextStyle(color: Colors.black, fontSize: 18),
        decoration: BoxDecoration(
            color: Color(0xFFB0C7E6).withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent)));
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
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 75, sigmaY: 75),
                child: SizedBox(
                  width: 70.w,
                  height: 66.w,
                  child: SvgPicture.asset(
                    'assets/images/ghologo.svg',
                    color: AppUtil().textcolor,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 12,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 24.h, right: 24.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        'Verify OTP',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 34.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Enter the OTP",
                        style: TextStyle(color: Colors.grey.shade700),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "We just send you on your registered email",
                        style: TextStyle(color: Colors.grey.shade700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                        child: Pinput(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            } else if (value.length != 6) {
                              return 'Enter a valid OTP of 6 digits';
                            } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'OTP should contain only numbers';
                            }
                            return null;
                          },
                          length: 6,
                          defaultPinTheme: defaultpintheme,
                          focusedPinTheme: defaultpintheme.copyWith(
                              decoration: defaultpintheme.decoration!.copyWith(
                                  border:
                                      Border.all(color: AppUtil().customBlue))),
                          onCompleted: (value) {
                            otpcontroller.text = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.isLoading.value = true;
                            var verifyOtpStatus =
                                await controller.userOTPConfirmation(
                                    controller.email,
                                    otpcontroller.text,
                                    context,
                                    'Forgot');
                            if (verifyOtpStatus || verifyOtpStatus != null) {
                              Get.toNamed(PageRouteName.forgetPassword);
                            }
                            controller.isLoading.value = false;
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [
                                Color(0xFF065FD5),
                                Color(0xFF064DAB),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Obx(
                              () => controller.isLoading.value == false
                                  ? Text(
                                      'Verify',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    )
                                  : LoadingAnimationWidget.fourRotatingDots(
                                      color: Colors.white,
                                      size: 24.w,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Didn't get the code?  ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () async {},
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                  color: AppUtil().textcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
