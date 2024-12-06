import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

import '../../../util/routes.dart';

class PatientsListForAppointment extends StatelessWidget {
  PatientsListForAppointment({super.key});
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'John Smith',
      'Age': '36',
      'Gender': 'Male',
      'CircleImage': 'J',
      'Color': Colors.orange
    },
    {
      'name': 'Tom Smith',
      'Age': '54',
      'Gender': 'Male',
      'CircleImage': 'T',
      'Color': Colors.blue,
    },
    {
      'name': 'Renjith Shyam',
      'Age': '25',
      'Gender': 'Male',
      'CircleImage': 'R',
      'Color': Colors.lightBlueAccent
    },
    {
      'name': 'Serina Smith',
      'Age': '50',
      'Gender': 'Female',
      'CircleImage': 'S',
      'Color': Colors.purple
    },
    {
      'name': 'Alina John',
      'Age': '24',
      'Gender': 'Female',
      'CircleImage': 'A',
      'Color': Colors.blue
    },
    {
      'name': 'Ben Smith',
      'Age': '24',
      'Gender': 'Male',
      'CircleImage': 'B',
      'Color': Colors.green
    },
  ];

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              top: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 15),
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
                height: 10.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: reviews.length,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.r),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(PageRouteName.appointmentforpatient);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                color: AppUtil().textcolor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12.r),
                                  bottomLeft: Radius.circular(12.r),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0).r,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30.r,
                                      backgroundColor: reviews[index]['Color'],
                                      child: Center(
                                        child: Text(
                                          reviews[index]['CircleImage'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            reviews[index]['name'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            "Age: ${reviews[index]['Age']}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          Text(
                                            "Gender: ${reviews[index]['Gender']}",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
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
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(PageRouteName.addappointmentmember);
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
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        'Add New Member',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 25,
                        ),
                      )
                    ],
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
}
