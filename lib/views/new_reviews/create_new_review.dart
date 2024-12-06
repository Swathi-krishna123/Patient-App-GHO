import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/views/inpatient/inpatient.dart';

import '../../util/routes.dart';

class CreateNewReview extends StatelessWidget {
  CreateNewReview({super.key});

  final CreateReviewController reviewController =
      Get.put(CreateReviewController());
  final List<ServiceItem> services = [
    ServiceItem(
      title: "What is a second opinion",
      description:
          "A second opinion is an additional medical evaluation from a different doctor to confirm or provide another perspective on your diagnosis or treatment plan.",
    ),
    ServiceItem(
      title: "Why should I get a second opinion?",
      description:
          "Obtaining a second opinion can help ensure you have the most accurate diagnosis and best treatment options. It can provide peace of mind, especially for complex, risky, or costly procedures.",
    ),
    ServiceItem(
      title: "How does the second opinion process work?",
      description:
          "The process begins by submitting your medical records, which are then reviewed by a specialist. After the evaluation, you receive a detailed report, often through a virtual or in-person consultation.",
    ),
    ServiceItem(
      title: "Is my medical information kept confidential?",
      description:
          "Yes, all your medical information is handled with strict confidentiality, using secure systems to ensure privacy and compliance with healthcare regulations",
    ),
    ServiceItem(
      title: "How long does it take to get a second opinion?",
      description:
          "The time varies, but generally, you can expect to receive a second opinion within a few days to a week, depending on the complexity of your case and the specialist’s availability.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            'My Reviews',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        actions: [
          Obx(() {
            if (reviewController.caseListModel.value == null ||
                reviewController.caseListModel.value!.Data.isEmpty ||
                reviewController.caseListModel.value!.Data[0].isEmpty) {
              return SizedBox();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(PageRouteName.patientinfo),
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0x40014EC4).withOpacity(0.20),
                        radius: 18.r,
                        child: Icon(
                          Icons.add,
                          size: 18.w,
                          color: AppUtil().textcolor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Create New Review',
                    style: TextStyle(
                      color: AppUtil().textcolor,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              );
            }
          }),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Obx(
            () {
              print(reviewController.caseListModel.value?.Data);
              if (reviewController.caseListModel.value == null ||
                  reviewController.caseListModel.value!.Data.isEmpty ||
                  reviewController.caseListModel.value!.Data[0].isEmpty) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(PageRouteName.patientinfo),
                        child: Container(
                          width: double.infinity,
                          height: 150.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppUtil().textcolor)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35.r,
                                backgroundColor:
                                    Color(0x40014EC4).withOpacity(0.20),
                                child: Center(
                                  child: CircleAvatar(
                                    backgroundColor: AppUtil().textcolor,
                                    radius: 20.r,
                                    child: Icon(
                                      Icons.add,
                                      size: 25.w,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppUtil().textcolor,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Create New Second Opinion',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'How It Works',
                        style: TextStyle(
                            color: AppUtil().textcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppUtil().customBlue.withOpacity(0.1)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/telemedicine/tele-img-11.png'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Submit Your Case',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              'Upload your medical records, including reports',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'scans and test results to our secure platform.',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/telemedicine/tele-img-12.png'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Expert Review',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              'Your case is thoroughly reviewed by leading',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'specialists across diverse medical fields, ensuring',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'expert and personalized analyzed of your condition',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/telemedicine/tele-img-13.png'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Personalized Report',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              'Receive a detailed second opinion report with',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'recommendations, alternative treatments or',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'confirmation of the initial diagnosis, all within 48 hours.',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                  'assets/images/telemedicine/tele-img-13.png'),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Follow-Up Support',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp),
                            ),
                            Text(
                              'If needed, schedule a follow-up consultation to',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'discuss the report with our experts or proceed',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            Text(
                              'with your healthcare provider based on the new insights.',
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 15.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Frequently Asked Questions',
                        style: TextStyle(
                            color: AppUtil().textcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ListView.separated(
                        separatorBuilder: (context, index) => Divider(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              title: Text(
                                services[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              tilePadding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              collapsedBackgroundColor: Colors.white,
                              trailing: Icon(Icons.keyboard_arrow_down_rounded),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Text(
                                    services[index].description,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: reviewController
                            .caseListModel.value?.Data[0].length,
                        itemBuilder: (context, index) {
                          var caseItem = reviewController
                              .caseListModel.value!.Data[0][index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15.h),
                            child: GestureDetector(
                              onTap: () async {
                                var status =
                                    await reviewController.getReviewCaseDetail(
                                        caseId: reviewController.caseListModel
                                            .value!.Data[0][index].id);

                                if (status) {
                                  Get.toNamed(
                                    PageRouteName.casedetail,
                                  );
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppUtil().customBlue,
                                          blurRadius: 0.8)
                                    ],
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border(
                                        left: BorderSide(
                                            width: 10.w,
                                            color: AppUtil().textcolor)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(15).r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${caseItem.FirstName} ${caseItem.LastName}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.sp),
                                              ),
                                            ],
                                          ),
                                          CircleAvatar(
                                            radius: 15.r,
                                            backgroundColor: Colors.blue,
                                            child: Center(
                                              child: Text(
                                                (caseItem.FirstName != null &&
                                                        caseItem.FirstName!
                                                            .isNotEmpty)
                                                    ? caseItem.FirstName!
                                                        .substring(0, 1)
                                                        .toUpperCase()
                                                    : 'N',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Submitted on: ${caseItem.RequestDate?.split(' ')[0]}',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 5,
                                                backgroundColor:
                                                    AppUtil().textcolor,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              caseItem.ReviewStatus == null
                                                  ? Text(
                                                      'In Progress',
                                                      style: TextStyle(
                                                          color: AppUtil()
                                                              .textcolor),
                                                    )
                                                  : Text(
                                                      caseItem.ReviewStatus!,
                                                      style: TextStyle(
                                                          color: AppUtil()
                                                              .textcolor),
                                                    ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: AppUtil().textcolor),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 40,
                                                  right: 40,
                                                  top: 5,
                                                  bottom: 5),
                                              child: Text(
                                                'View',
                                                style: TextStyle(
                                                  color: AppUtil().textcolor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: caseItem.Status == "1" ||
                                                        caseItem.Status == "2"
                                                    ? AppUtil()
                                                        .textcolor
                                                        .withOpacity(0.5)
                                                    : AppUtil().textcolor,
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 3,
                                                    left: 3,
                                                    top: 5,
                                                    bottom: 5),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.download,
                                                      color: Colors.white,
                                                      size: 18,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'Download Opinion',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                )),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}
