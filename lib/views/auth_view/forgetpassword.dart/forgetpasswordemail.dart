import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../util/routes.dart';

class Forgetpasswordemail extends StatelessWidget {
  Forgetpasswordemail({super.key});
  final AppUserController controller = Get.put(AppUserController());
  final TextEditingController emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 70.w,
                height: 66.w,
                child: SvgPicture.asset(
                  'assets/images/ghologo.svg',
                  color: AppUtil().textcolor,
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                'Forget Password?',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 34.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Enter your Email",
                style: TextStyle(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
              Text(
                "We will send you a verification code.",
                style: TextStyle(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Color(0xB2B0C7E6), width: 1),
                ),
                child: TextFormField(
                  controller: emailcontroller,
                  validator: controller.validateEmail,
                  cursorColor: AppUtil().textcolor,
                  onChanged: (value) => controller.validateEmail,
                  decoration: InputDecoration(
                    hintText: 'Enter your registered email',
                    enabledBorder: InputBorder.none,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(85.r)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(85.r)),
                    ),
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(12.r),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.isLoading.value = true;
                    var newOTPStatus = false;
                    newOTPStatus =
                        await controller.newOTP(emailcontroller.text);
                    if (newOTPStatus) {
                      controller.email = emailcontroller.text;
                      Get.toNamed(PageRouteName.forgetotp);
                    }
                    controller.isLoading.value = false;
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 55.h,
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
                              'Continue',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            )
                          : LoadingAnimationWidget.fourRotatingDots(
                              color: Colors.white,
                              size: 35.sp,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
