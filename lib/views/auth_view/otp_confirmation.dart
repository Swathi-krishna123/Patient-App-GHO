import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pinput/pinput.dart';

import '../../util/constant.dart';
import '../../util/routes.dart';

class OtpConfirmation extends StatefulWidget {
  OtpConfirmation({super.key});

  @override
  State<OtpConfirmation> createState() => _OtpConfirmationState();
}

class _OtpConfirmationState extends State<OtpConfirmation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.startTimer();
    print("Time ${controller.remainingSeconds.value}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.timer?.cancel();
    super.dispose();
  }

  final TextEditingController otpcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AppUserController controller = Get.put(AppUserController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final defaultpintheme = PinTheme(
        width: 56,
        height: 60,
        textStyle: TextStyle(color: Colors.black, fontSize: 18),
        decoration: BoxDecoration(
            color: Color(0xFFB0C7E6).withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.transparent)));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: AppUtil().textcolor,
            ),
            Positioned(
              top: size.height / 2,
              child: Container(
                width: size.width,
                height: size.height / 1.5,
                color: Colors.white,
              ),
            ),
            Positioned(
              left: size.width / 25,
              right: size.width / 25,
              top: 25,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 8,
                    height: size.height / 8,
                    child: SvgPicture.asset('assets/images/ghologo.svg'),
                  ),
                  Text(
                    'Verify\nEmail Address',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width / 11,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "OTP has been sent to ${controller.email}",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width / 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height / 2.6,
              left: 25,
              right: 25,
              child: Container(
                width: size.width,
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
                  padding: EdgeInsets.only(
                      left: size.width / 20,
                      top: size.width / 15,
                      right: size.width / 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                decoration: defaultpintheme.decoration!
                                    .copyWith(
                                        border: Border.all(
                                            color: AppUtil().customBlue))),
                            onCompleted: (value) {
                              otpcontroller.text = value;
                            },
                          ),
                        ),
                        AppUtil().h15,
                        Obx(
                          () => Text(
                            "The OTP is valid till: ${controller.formatDuration(controller.remainingSeconds.value)}",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        AppUtil().h10,
                        Obx(() => controller.remainingSeconds.value == 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Checkbox(
                                      value: controller.isChecked.value,
                                      onChanged: (value) {
                                        controller.isChecked.value = value!;
                                      },
                                      activeColor: AppUtil().textcolor,
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: AppUtil().customBlue,
                                        width: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Didn't get OTP Code?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            : SizedBox()),
                        SizedBox(
                          height: 5,
                        ),
                        Obx(() => controller.remainingSeconds.value == 0 &&
                                controller.isChecked.value
                            ? GestureDetector(
                                onTap: () async {
                                  var status = await controller.newOTP(
                                    controller.email,
                                  );
                                  if (status) {
                                    controller.startTimer();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        CommonWidgets().snackBarinfo(
                                            'A new OTP has been sent to your registered email ID'));
                                  }
                                },
                                child: Text(
                                  'RESEND',
                                  style: TextStyle(
                                      color: AppUtil().textcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            : SizedBox()),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              controller.isLoading.value = true;
                              var userotpstatus = false;
                              if (otpcontroller.text.isNotEmpty) {
                                userotpstatus =
                                    await controller.userOTPConfirmation(
                                        controller.email,
                                        otpcontroller.text,
                                        context,
                                        'Login');
                              }
                              var userdetailsresponsestatus = false;
                              if (userotpstatus == true) {
                                userdetailsresponsestatus =
                                    await controller.getUserDetails();
                              }
                              controller.update();

                              if (userotpstatus &&
                                  userdetailsresponsestatus == true &&
                                  controller.userDetail.value?.FirstName !=
                                      null) {
                                controller.isLoading.value = false;
                                Get.offAllNamed(PageRouteName.mainpage);
                              }
                              controller.isLoading.value = false;
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
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
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              25,
                                        ),
                                      )
                                    : LoadingAnimationWidget.fourRotatingDots(
                                        color: Colors.white,
                                        size:
                                            MediaQuery.of(context).size.width /
                                                10,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container loginTextform({
    TextEditingController? textcontroller,
    String? hinttext,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xB2B0C7E6), width: 1),
      ),
      child: TextFormField(
        controller: textcontroller,
        validator: validator,
        cursorColor: AppUtil().textcolor,
        decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(85)),
          ),
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
