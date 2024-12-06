import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/common_widgets.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../util/routes.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final AppUserController controller = Get.put(AppUserController());
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
                    'Sign Up',
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
                        "Already have an account    ",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(PageRouteName.login);
                        },
                        child: Text(
                          "Sign In",
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
              bottom: size.height / 15,
              child: Container(
                width: size.width,
                height: size.height / 1.8,
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
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        CommonWidgets().textFormField(
                            hinttext: 'Enter your first name',
                            txtController: firstnamecontroller),
                        const SizedBox(height: 20),
                        CommonWidgets().textFormField(
                            hinttext: 'Enter your last name',
                            txtController: lastnamecontroller),
                        const SizedBox(height: 20),
                        phonenumberTxtfield(context),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonWidgets().textFormField(
                            hinttext: 'Enter your email',
                            txtController: emailcontroller),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: Color(0xB2B0C7E6), width: 1),
                          ),
                          child: Obx(
                            () => TextFormField(
                              controller: passwordcontroller,
                              obscureText:
                                  controller.registerpassobscureText.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                }
                                return null;
                              },
                              cursorColor: AppUtil().textcolor,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.registerpassobscureText.value =
                                        !controller
                                            .registerpassobscureText.value;
                                  },
                                  icon: Icon(
                                    controller.registerpassobscureText.value
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
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(color: Color(0xB2B0C7E6), width: 1),
                          ),
                          child: Obx(
                            () => TextFormField(
                              controller: confirmcontroller,
                              obscureText: controller
                                  .registerconfirmpassobscureText.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'This field is Required';
                                } else if (value.isNotEmpty &&
                                    passwordcontroller.text !=
                                        confirmcontroller.text) {
                                  return 'Password and Confirm password is not matching';
                                }
                                return null;
                              },
                              cursorColor: AppUtil().textcolor,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.registerconfirmpassobscureText
                                            .value =
                                        !controller
                                            .registerconfirmpassobscureText
                                            .value;
                                  },
                                  icon: Icon(
                                    controller.registerconfirmpassobscureText
                                            .value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: 'Confirm password',
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
                          height: 20,
                        ),
                        Row(
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
                              "I agree to the ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.width / 35),
                            ),
                            Text(
                              "Terms of Service ",
                              style: TextStyle(
                                  color: AppUtil().textcolor,
                                  fontSize: size.width / 35),
                            ),
                            Text(
                              "& ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.width / 35),
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  color: AppUtil().textcolor,
                                  fontSize: size.width / 35),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (controller.isChecked.value &&
                                _formKey.currentState!.validate()) {
                              var responsedatastatus =
                                  await controller.userRegistration(
                                      firstnamecontroller.text,
                                      lastnamecontroller.text,
                                      emailcontroller.text,
                                      passwordcontroller.text,
                                      phonecontroller.text);
                              if (responsedatastatus == 1) {
                                controller.email = emailcontroller.text;
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBarinfo(controller.data));
                                Get.toNamed(PageRouteName.otpConfirmation);
                              } else if (responsedatastatus == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBarinfo(controller.data));
                              }
                            }
                          },
                          child: Obx(
                            () => Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 18,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: controller.isChecked.value
                                        ? const [
                                            Color(0xFF065FD5),
                                            Color(0xFF064DAB),
                                          ]
                                        : [
                                            Color(0xFF065FD5).withOpacity(0.6),
                                            Color(0xFF064DAB).withOpacity(0.6),
                                          ]),
                              ),
                              child: Center(
                                child: Obx(
                                  () => controller.isLoading.value == false
                                      ? Text(
                                          'Sign Up',
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
                                          size: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              10,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
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

  Row phonenumberTxtfield(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Color(0xB2B0C7E6), width: 1),
          ),
          child: Center(
            child: CountryCodePicker(
              onChanged: (country) {
                controller.countryId = country.dialCode;
                print(controller.countryId);
              },
              initialSelection: '+91',
              favorite: ['+91', '+1', '+65'],
              countryFilter: AppUtil().countryfilter,
              showFlag: true,
              alignLeft: true,
              showCountryOnly: false,
              showOnlyCountryWhenClosed: true,
              showDropDownButton: false,
              showFlagDialog: true,
              hideMainText: true,
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color(0xB2B0C7E6), width: 1),
            ),
            child: TextFormField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              cursorColor: AppUtil().textcolor,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is Required';
                } else if (value.isNotEmpty) {
                  bool isValid = CountryUtils.validatePhoneNumber(
                      phonecontroller.text, controller.countryId!);
                  if (isValid) {
                    print('Valid Number');
                  } else {
                    return 'Enter a valid Number';
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter Your Number',
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
          ),
        ),
      ],
    );
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
