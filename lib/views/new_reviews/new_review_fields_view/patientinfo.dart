import 'package:country_code_picker_plus/country_code_picker_plus.dart';
import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../util/routes.dart';

class PatientInfo extends StatelessWidget {
  PatientInfo({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controllers for form inputs
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController numController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final CreateReviewController controller = Get.put(CreateReviewController());
  final AppUserController userController = Get.put(AppUserController());
  String? dobErrorMessage;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.setStep(0);
    });

    return WillPopScope(
      onWillPop: () async {
        await controller.getAllCasesList();
        Get.back();
        controller.isChecked.value = false;
        return true;
      },
      child: Scaffold(
        key: _scaffoldKey,
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
            'New Second Opinion',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: StepperIcons(),
                  ),
                  Text(
                    'Patient Info',
                    style: TextStyle(
                      color: AppUtil().textcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: (value) {
                            controller.isChecked.value = value!;
                            if (controller.isChecked.value) {
                              numController.text =
                                  userController.userDetail.value?.Phone;
                              firstnameController.text =
                                  userController.userDetail.value?.FirstName;
                              lastnameController.text =
                                  userController.userDetail.value?.LastName;
                            } else {
                              numController.clear();
                              firstnameController.clear();
                              lastnameController.clear();
                            }
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
                        "Use my profile information",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  personalTextform(
                      title: 'First Name *',
                      controller: firstnameController,
                      hinttext: 'Enter Your First Name',
                      validator: userController.validateField),
                  personalTextform(
                      title: 'Last Name *',
                      controller: lastnameController,
                      hinttext: 'Enter Your Last Name',
                      validator: userController.validateField),
                  genderSelection(controller),
                  dobTextFormField(context),
                  phoneNumberInput(),
                  SizedBox(height: 10),
                  personalTextform(
                      title: 'Occupation *',
                      controller: occupationController,
                      hinttext: 'Enter Your Occupation',
                      validator: userController.validateField),
                  SizedBox(height: 10),
                  saveAndContinueButton(context),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding personalTextform({
    required String title,
    required TextEditingController controller,
    required String hinttext,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: controller,
              validator: validator,
              cursorColor: AppUtil().textcolor,
              maxLines:
                  hinttext == 'Address 1' || hinttext == 'Address 2' ? 4 : 1,
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: TextStyle(color: Colors.grey),
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
        ],
      ),
    );
  }

  Widget genderSelection(CreateReviewController controller) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gender *',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Obx(() {
            return Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: controller.gender.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.changeGender(value);
                    }
                  },
                ),
                const Text('Male'),
                Radio<bool>(
                  value: true,
                  groupValue: controller.gender.value,
                  onChanged: (bool? value) {
                    if (value != null) {
                      controller.changeGender(value);
                    }
                  },
                ),
                const Text('Female'),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget dobTextFormField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date Of Birth *',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: dobController,
              validator: userController.validateField,
              cursorColor: AppUtil().textcolor,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(8),
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final text = newValue.text;
                  if (newValue.text.length < oldValue.text.length) {
                    return newValue;
                  }
                  if (text.length > 10) {
                    return oldValue;
                  }
                  StringBuffer buffer = StringBuffer();
                  for (int i = 0; i < text.length; i++) {
                    buffer.write(text[i]);
                    if (i == 1 || i == 3) {
                      buffer.write('/'); // Insert '/' after day and month
                    }
                  }

                  return TextEditingValue(
                    text: buffer.toString(),
                    selection: TextSelection.collapsed(offset: buffer.length),
                  );
                }),
              ],
              onChanged: (value) {
                validateDOB(value, context);
              },
              decoration: InputDecoration(
                hintText: 'MM/DD/YYYY',
                hintStyle: TextStyle(color: Colors.grey),
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
          // Display the error message if it exists
          if (dobErrorMessage != null) ...[
            SizedBox(height: 5),
            Text(
              dobErrorMessage!,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }

  void validateDOB(String value, BuildContext context) {
    final currentDate = DateTime.now();
    dobErrorMessage = null; // Reset error message

    if (value.length == 10) {
      final parts = value.split('/');
      final day = int.tryParse(parts[1]) ?? 0;
      final month = int.tryParse(parts[0]) ?? 0;
      final year = int.tryParse(parts[2]) ?? 0;

      if (day > 31) {
        dobErrorMessage = "Day cannot be greater than 31";
      } else if (month > 12) {
        dobErrorMessage = "Month cannot be greater than 12";
      } else if (year > currentDate.year) {
        dobErrorMessage = "Year cannot be in the future";
      } else if (DateTime(year, month, day).isAfter(currentDate)) {
        dobErrorMessage = "Date cannot be later than today";
      }
    }

    // Trigger a rebuild to update the error message
    (context as Element).markNeedsBuild();
  }

  Widget phoneNumberInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone Number',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: CountryCodePicker(
                    onChanged: (value) {
                      userController.countryId = value.dialCode;
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
                    border: Border.all(color: Colors.grey),
                  ),
                  child: TextFormField(
                    controller: numController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is Required';
                      } else if (value.isNotEmpty) {
                        bool isValid = CountryUtils.validatePhoneNumber(
                            numController.text, userController.countryId!);
                        if (isValid) {
                          print('Valid Number');
                        } else {
                          return 'Enter a valid Number';
                        }
                      }
                      return null;
                    },
                    cursorColor: AppUtil().textcolor,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      hintStyle: TextStyle(color: Colors.grey),
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
          ),
        ],
      ),
    );
  }

  Widget saveAndContinueButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          controller.isLoading.value = true;
          var createReviewAddpatientStatus =
              await controller.createReviewAddPatient(
                  firstName: firstnameController.text,
                  lastName: lastnameController.text,
                  cellPhone: numController.text,
                  gender: controller.getGenderAsString(),
                  occupation: occupationController.text,
                  DOB: dobController.text);
          var questionstatus = await controller.caseQuestions();
          if (createReviewAddpatientStatus && questionstatus) {
            await controller.getListSpeciality();
            controller.isLoading.value = false;
            Get.toNamed(PageRouteName.medicaldetails);
          }
        }
        controller.isLoading.value = false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 19,
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
                  'Save and Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 25,
                  ),
                )
              : LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: MediaQuery.of(context).size.width / 10,
                ),
        )),
      ),
    );
  }
}

class StepperIcons extends StatelessWidget {
  StepperIcons({
    super.key,
  });
  final CreateReviewController stepperController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => SvgPicture.asset(
              'assets/icons/steppericon.svg',
              color: stepperController.currentStep.value >= 0
                  ? Colors.green
                  : Colors.grey,
              width: 30,
              height: 30,
            )),
        Expanded(
            child: Container(
          height: 2,
          color: stepperController.currentStep.value >= 0
              ? Colors.green
              : Colors.grey,
        )),
        Obx(() => SvgPicture.asset(
              'assets/icons/steppericon.svg',
              color: stepperController.currentStep.value >= 1
                  ? Colors.green
                  : Colors.grey,
              width: 30,
              height: 30,
            )),
        Expanded(
            child: Container(
          height: 2,
          color: stepperController.currentStep.value >= 1
              ? Colors.green
              : Colors.grey,
        )),
        Obx(() => SvgPicture.asset(
              'assets/icons/steppericon.svg',
              color: stepperController.currentStep.value >= 2
                  ? Colors.green
                  : Colors.grey,
              width: 30,
              height: 30,
            )),
        Expanded(
            child: Container(
          height: 2,
          color: stepperController.currentStep.value >= 2
              ? Colors.green
              : Colors.grey,
        )),
        Obx(() => SvgPicture.asset(
              'assets/icons/steppericon.svg',
              color: stepperController.currentStep.value >= 3
                  ? Colors.green
                  : Colors.grey,
              width: 30,
              height: 30,
            )),
        Expanded(
            child: Container(
          height: 2,
          color: stepperController.currentStep.value >= 3
              ? Colors.green
              : Colors.grey,
        )),
        Obx(() => SvgPicture.asset(
              'assets/icons/steppericon.svg',
              color: stepperController.currentStep.value >= 4
                  ? Colors.green
                  : Colors.grey,
              width: 30,
              height: 30,
            )),
      ],
    );
  }
}
