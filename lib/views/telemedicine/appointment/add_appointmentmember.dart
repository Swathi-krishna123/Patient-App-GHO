import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AddAppointmentmember extends StatelessWidget {
  AddAppointmentmember({super.key});

  final AppController controller = Get.find();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController summarycontroller = TextEditingController();
  final TextEditingController numcontroller = TextEditingController();
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
          'Book Your Telemedicine Consultation',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 15,
            top: MediaQuery.of(context).size.width / 50,
            right: MediaQuery.of(context).size.width / 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Appointment For',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              personalTextform(
                  controller: lastnamecontroller,
                  hinttext: 'Enter Your Last Name'),
              SizedBox(
                height: 15.h,
              ),
              personalTextform(
                  controller: firstnamecontroller,
                  hinttext: 'Enter Your First Name'),
              SizedBox(
                height: 15.h,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: AppUtil().containerColor),
                  ),
                  child: IntlPhoneField(
                    initialCountryCode: 'IN',
                    controller: numcontroller,
                    pickerDialogStyle:
                        PickerDialogStyle(backgroundColor: Colors.white),
                    dropdownDecoration: BoxDecoration(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
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
                  )),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Gender',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5,
              ),
              Obx(() {
                return Row(
                  children: [
                    Radio<bool>(
                      activeColor: AppUtil().textcolor,
                      value: false,
                      groupValue: controller.genderappointment.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.changeGenderAppointment(value);
                        }
                      },
                    ),
                    const Text('Male'),
                    Radio<bool>(
                      value: true,
                      activeColor: AppUtil().textcolor,
                      groupValue: controller.genderappointment.value,
                      onChanged: (bool? value) {
                        if (value != null) {
                          controller.changeGenderAppointment(value);
                        }
                      },
                    ),
                    const Text('Female'),
                  ],
                );
              }),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Description',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppUtil().containerColor),
                ),
                child: TextFormField(
                  controller: summarycontroller,
                  cursorColor: AppUtil().textcolor,
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText:
                        'Describe Your Condition, including symptoms and duration.',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(12),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {},
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
                      child: Text(
                    'Continue Payment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 25,
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget personalTextform(
      {TextEditingController? controller, String? hinttext}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppUtil().containerColor),
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppUtil().textcolor,
        maxLines: hinttext == 'Address 1'
            ? 4
            : hinttext == 'Address 2'
                ? 4
                : 1,
        decoration: InputDecoration(
          hintText: hinttext!,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
