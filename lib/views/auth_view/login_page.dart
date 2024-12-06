import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../util/routes.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final AppUserController controller = Get.put(AppUserController());
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              top: 45,
              child: Column(
                children: [
                  SizedBox(
                    width: size.width / 8,
                    height: size.height / 8,
                    child: SvgPicture.asset('assets/images/ghologo.svg'),
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 36),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account    ",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(PageRouteName.register);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: size.height / 3,
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
                  child: Column(
                    children: [
                      loginTextform(
                          textcontroller: emailcontroller,
                          hinttext: 'Enter Your Email',
                          validator: controller.validateEmail),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border:
                              Border.all(color: Color(0xB2B0C7E6), width: 1),
                        ),
                        child: Obx(
                          () => TextFormField(
                            controller: passwordController,
                            obscureText: controller.loginpassobscureText.value,
                            validator: controller.validateField,
                            cursorColor: AppUtil().textcolor,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.loginpassobscureText.value =
                                      !controller.loginpassobscureText.value;
                                },
                                icon: Icon(
                                  controller.loginpassobscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: 'Enter password',
                              enabledBorder: InputBorder.none,
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(85)),
                              ),
                              focusedBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => Get.toNamed(PageRouteName.forgetemail),
                          child: RichText(
                            text: TextSpan(
                              text: 'Forget Password?',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 35,
                                color: AppUtil().textcolor,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            var responsedatastatus =
                                await controller.userSignIN(
                                    emailcontroller.text,
                                    passwordController.text);
                            if (responsedatastatus == 1) {
                              controller.email = emailcontroller.text;
                              controller.password = passwordController.text;
                              ScaffoldMessenger.of(context).showSnackBar(
                                  CommonWidgets()
                                      .snackBarinfo(controller.data));
                              Get.toNamed(PageRouteName.otpConfirmation);
                            } else if (responsedatastatus == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  CommonWidgets()
                                      .snackBarinfo(controller.data));
                            }
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
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                25,
                                      ),
                                    )
                                  : LoadingAnimationWidget.fourRotatingDots(
                                      color: Colors.white,
                                      size: MediaQuery.of(context).size.width /
                                          10,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Or signup using',
                      //       style: TextStyle(color: AppUtil().textcolor),
                      //     ),
                      //     SvgPicture.asset('assets/icons/google.svg'),
                      //     SvgPicture.asset('assets/icons/apple.svg'),
                      //     SvgPicture.asset('assets/icons/meta.svg'),
                      //     SvgPicture.asset('assets/icons/windows.svg'),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
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
