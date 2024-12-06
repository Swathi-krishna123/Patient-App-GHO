import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

class Appointmentforpatient extends StatelessWidget {
  Appointmentforpatient({super.key});
  final TextEditingController summarycontroller = TextEditingController();
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppUtil().customBlue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4.r)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30, top: 15, bottom: 15).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundColor: Colors.orangeAccent,
                            child: Center(
                              child: Text(
                                'J',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Smith',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp),
                              ),
                              Text(
                                'Male | India',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.sp),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Date Of Birth:  24/09/1988',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Contact Number:  +91 9854632578',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
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
                  border: Border.all(color: Colors.grey),
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
}
