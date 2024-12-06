import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

import '../../util/routes.dart';

class Telemedicine extends StatelessWidget {
  Telemedicine({super.key});

  final TextEditingController searchcontroller = TextEditingController();
  final AppUserController userController = Get.put(AppUserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 15,
                top: MediaQuery.of(context).size.width / 50,
                right: MediaQuery.of(context).size.width / 15),
            child: Column(
              children: [
                _buildHeader(context),
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
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Specialities',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(PageRouteName.specialities);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                            decorationColor: Colors.grey,
                            decoration: TextDecoration.underline,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10.w,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    var title = [
                      'Cardiology',
                      'Oncology',
                      'Neurology',
                      'Dentist'
                    ];
                    var images = [
                      'assets/images/telemedicine/tele-img-19.jpg',
                      'assets/images/telemedicine/tele-img-24.jpg',
                      'assets/images/telemedicine/tele-img-18.jpg',
                      'assets/images/telemedicine/tele-img-23.jpg'
                    ];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(PageRouteName.specialititydetails);
                      },
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
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(PageRouteName.doctordetail),
                  child: Container(
                    width: double.infinity,
                    height: 195.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: const [
                          BoxShadow(
                              spreadRadius: 0.1,
                              color: Color(0xFFA9A5A5),
                              blurStyle: BlurStyle.outer)
                        ],
                        color: Colors.white),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 20.r, right: 20.r, top: 10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upcoming Appointments',
                            style: TextStyle(
                                color: AppUtil().textcolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: AppUtil().textcolor),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0).r,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/clockicon.svg',
                                            width: 24.w,
                                            height: 24.h,
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                '10:30 am',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                'September 15',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage(
                                    'assets/images/telemedicine/tele-img-1.png'),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Dr Merin Jacob',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Pediatrics',
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Top Doctors For You',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(PageRouteName.doctorslist);
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                            decorationColor: Colors.grey,
                            decoration: TextDecoration.underline,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.r),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(PageRouteName.doctordetail),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.r),
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
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                            'assets/images/Article img 4.png'),
                                      ),
                                      SizedBox(width: 16.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Dr Smitha',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Dentist',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.yellow,
                                                    size: 16),
                                                SizedBox(width: 4.w),
                                                Text(
                                                  '${4.6}',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  ' | ${125} Reviews',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage(
                'assets/images/dummyprofile.jpeg',
              ),
              radius: 25.r,
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 35),
            Obx(
              () => Text(
                  'Welcome ${userController.userDetail.value?.FirstName}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(PageRouteName.calender);
              },
              child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Color(0xFFE1E7EE),
                  child: SvgPicture.asset(
                    'assets/icons/calender.svg',
                    fit: BoxFit.fill,
                    width: 24.w,
                    height: 24.h,
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(PageRouteName.yourprescription);
              },
              child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Color(0xFFE1E7EE),
                  child: SvgPicture.asset(
                    'assets/icons/addprescription.svg',
                    fit: BoxFit.fill,
                    width: 24.w,
                    height: 24.h,
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(PageRouteName.notificationPage),
              child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Color(0xFFE1E7EE),
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    fit: BoxFit.fill,
                    width: 24.w,
                    height: 24.h,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
