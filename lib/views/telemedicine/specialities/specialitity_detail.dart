import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/telemedicinecontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
import 'package:global_health_opinion_sample/views/inpatient/inpatient.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialitityDetail extends StatelessWidget {
  SpecialitityDetail({super.key});
  final Telemedicinecontroller telemedicinecontroller =
      Get.put(Telemedicinecontroller());

  final List<Map<String, String>> steps = [
    {
      'title': 'Select Your Specialty',
      'description': 'Choose "Dental Care" from our list of specialties.',
    },
    {
      'title': 'Pick Your Preferred Consultation Type',
      'description': 'Choose between Messaging or Video Call consultations.',
    },
    {
      'title': 'Select a Time Slot',
      'description':
          'Browse available appointment times that fit your schedule.',
    },
    {
      'title': 'Confirm and Pay',
      'description':
          'Securely complete your booking with our easy-to-use payment system.',
    },
    {
      'title': 'Join Your Consultation',
      'description':
          'For video calls, join the appointment through the link provided in your confirmation email. For audio calls, simply answer the call from our specialist at the scheduled time.',
    },
  ];

  final List<ServiceItem> services = [
    ServiceItem(
      title: "Join Your Consultation",
      description:
          "For video calls, join the appointment through the link provided in your confirmation email. For audio calls, simply answer the call from our specialist at the scheduled time",
    ),
    ServiceItem(
      title: "Can I send pictures of my dental issue?",
      description:
          "Yes, you can upload pictures of your dental issue to give the doctor a clearer understanding of your condition. Make sure the images are clear and taken in good lighting for the most accurate assessment.",
    ),
    ServiceItem(
      title: "Is this service available for urgent dental emergencies?",
      description:
          "This service is designed for non-emergency consultations. For urgent or life-threatening dental emergencies, please visit an emergency room or contact your local urgent care center immediately.",
    ),
    ServiceItem(
      title: "How secure is my telemedicine appointment?",
      description:
          "Your telemedicine appointment is fully secure. We use encrypted technology to protect your personal information and ensure that your consultation remains private and confidential in compliance with HIPAA regulations.",
    ),
    ServiceItem(
      title:
          "What if I need in-person visit after the telemedicine consultation?",
      description:
          "If an in-person visit is necessary, your doctor will provide guidance on next steps, such as referring you to a nearby dental clinic or scheduling a follow-up appointment to ensure you get the care you need.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(0, 15.h),
        child: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: SizedBox(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30), topRight: Radius.circular(30))
                .r),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 15,
                right: MediaQuery.of(context).size.width / 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 32.w,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: AppUtil().textcolor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    Positioned(
                      width: 250,
                      height: 250,
                      child: Image.asset(
                        'assets/images/image.png',
                      ),
                    ),
                    Positioned(
                        right: 30.w,
                        top: 40.h,
                        child: Text(
                          'Convenient, Expert\nDental Care From\nAnywhere',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Choose Appointment Type',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Obx(
                      () => GestureDetector(
                        onTap: () {
                          telemedicinecontroller.selectedAppointment.value =
                              'Audio';
                        },
                        child: Container(
                          height: 191.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppUtil().customBlue),
                              color: telemedicinecontroller
                                          .selectedAppointment.value ==
                                      'Audio'
                                  ? AppUtil().customBlue.withOpacity(0.1)
                                  : Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 15)
                                        .r,
                                child: Row(
                                  children: [
                                    Text(
                                      "\$50.00",
                                      style: TextStyle(
                                          color: AppUtil().textcolor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26.sp,
                                          fontFamily: GoogleFonts.nunitoSans()
                                              .fontFamily),
                                    ),
                                    Text(
                                      "per",
                                      style: TextStyle(
                                          color: AppUtil().textcolor,
                                          fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25).r,
                                child: Text(
                                  'Audio Visit',
                                  style: TextStyle(
                                      color: AppUtil().textcolor,
                                      fontSize: 18.sp),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Divider(
                                color: AppUtil().customBlue,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25)
                                        .r,
                                child: Text(
                                  'Ideal for quick assessments and advice',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.sp),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: Obx(() => GestureDetector(
                              onTap: () {
                                telemedicinecontroller
                                    .selectedAppointment.value = 'Video';
                              },
                              child: Container(
                                height: 191.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: telemedicinecontroller
                                                .selectedAppointment.value ==
                                            'Video'
                                        ? AppUtil().customBlue.withOpacity(0.1)
                                        : Colors.white,
                                    border: Border.all(
                                        color: AppUtil().customBlue)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                              left: 20, right: 15)
                                          .r,
                                      child: Row(
                                        children: [
                                          Text(
                                            "\$80.00",
                                            style: TextStyle(
                                                color: AppUtil().textcolor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26.sp,
                                                fontFamily:
                                                    GoogleFonts.nunitoSans()
                                                        .fontFamily),
                                          ),
                                          Text(
                                            "per",
                                            style: TextStyle(
                                                color: AppUtil().textcolor,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 25).r,
                                      child: Text(
                                        'Video Visit',
                                        style: TextStyle(
                                            color: AppUtil().textcolor,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Divider(
                                      color: AppUtil().customBlue,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                              left: 25, right: 25)
                                          .r,
                                      child: Text(
                                        'Comprehensive consultation with visual assessments and e-prescriptions',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Our Dental Telemedicine service offers expert consultations from the comfort of your home. Whether you need advice on toothaches, gum issues, oral hygiene, or a follow-up, our certified specialists are here to help. Through secure video or messaging, you can discuss symptoms, receive advice, and get prescriptions if needed.',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'How to Book Online',
                  style: TextStyle(
                      color: AppUtil().textcolor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  steps[index]['title']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  steps[index]['description']!,
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
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
                        'Initial Assessment',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                      Text(
                        'Your specialist reviews your info before the',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                      Text(
                        'consultation.',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
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
                        'Consulation',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                      Text(
                        'Video Call: Join at the scheduled time for a live',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                      Text(
                        'discussion.',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Audio Call: Recieve a call from the dentist.',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
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
                        'Treatment Plan & Prescription',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                      Text(
                        'Get personlized advice and an e-prescription if',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      ),
                      Text(
                        'needed.',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
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
                GestureDetector(
                  onTap: () {
                    Get.toNamed(PageRouteName.doctordetail);
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
                        child: Text(
                      'Book Now',
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
      ),
    );
  }
}
