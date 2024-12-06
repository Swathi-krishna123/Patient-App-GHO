import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final AppUserController controller = Get.put(AppUserController());
  final TextEditingController newpasscontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
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
                'Create new password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 34.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Your new password must be different form previously used password",
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
                child: Obx(
                  () => TextFormField(
                    controller: newpasscontroller,
                    obscureText: controller.resetPasswordobscureText.value,
                    validator: controller.validateField,
                    cursorColor: AppUtil().textcolor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.resetPasswordobscureText.value =
                              !controller.resetPasswordobscureText.value;
                        },
                        icon: Icon(
                          controller.resetPasswordobscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'New password',
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
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Color(0xB2B0C7E6), width: 1.w),
                ),
                child: Obx(
                  () => TextFormField(
                    controller: confirmpasscontroller,
                    obscureText:
                        controller.resetPasswordConfirmobscureText.value,
                    validator: controller.validateField,
                    cursorColor: AppUtil().textcolor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.resetPasswordConfirmobscureText.value =
                              !controller.resetPasswordConfirmobscureText.value;
                        },
                        icon: Icon(
                          controller.resetPasswordConfirmobscureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                      ),
                      hintText: 'Confirm new password',
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
              ),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    controller.isLoading.value = true;
                    var changePasswordStatus = false;
                    changePasswordStatus = await controller.forgetPassword(
                      token: controller.token,
                      password: newpasscontroller.text,
                    );
                    controller.isLoading.value = false;
                    if (changePasswordStatus) {
                      Get.toNamed(PageRouteName.login);
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
                              'Reset Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            )
                          : LoadingAnimationWidget.fourRotatingDots(
                              color: Colors.white,
                              size: 24.sp,
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
