import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';

class Specialities extends StatelessWidget {
  Specialities({super.key});

  TextEditingController searchcontroller = TextEditingController();

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
          'Specialities',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              top: MediaQuery.of(context).size.width / 50,
              right: MediaQuery.of(context).size.width / 15),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 400.w,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Color(0xFFB0C7E6),
                  ),
                ),
                child: TextFormField(
                  controller: searchcontroller,
                  cursorColor: AppUtil().textcolor,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(12).w,
                    hintText: 'Search Hospital/Doctor/Speciality...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10.w,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemCount: 11,
                itemBuilder: (context, index) {
                  var title = [
                    'Cardiology',
                    'Oncology',
                    'Neurology',
                    'Dentist',
                    'Pediatrician',
                    'Physiotherapist',
                    'Gynecologist',
                    'Rhematology',
                    'General Surgeon',
                    'Orthopedist',
                    'General Physician'
                  ];
                  var images = [
                    'assets/images/telemedicine/tele-img-19.jpg',
                    'assets/images/telemedicine/tele-img-24.jpg',
                    'assets/images/telemedicine/tele-img-18.jpg',
                    'assets/images/telemedicine/tele-img-23.jpg',
                    'assets/images/telemedicine/tele-img-17.jpg',
                    'assets/images/telemedicine/tele-img-22.jpg',
                    'assets/images/telemedicine/tele-img-16.jpg',
                    'assets/images/telemedicine/tele-img-21.jpg',
                    'assets/images/telemedicine/tele-img-15.jpg',
                    'assets/images/telemedicine/tele-img-20.jpg',
                    'assets/images/telemedicine/tele-img-14.jpg',
                  ];

                  return GestureDetector(
                    onTap: () => Get.toNamed(PageRouteName.doctordetail),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                              colors: [
                                AppUtil().textcolor.withOpacity(0.6),
                                AppUtil().textcolor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Opacity(
                              opacity: 0.35,
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                title[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
