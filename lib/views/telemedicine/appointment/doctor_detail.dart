import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

import '../../../util/routes.dart';

class DoctorDetail extends StatelessWidget {
  DoctorDetail({super.key});
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Thomas Derik',
      'rating': 4.6,
      'date': '05/10/2023',
      'comment':
          'Dr. Merin Jacob made me feel completely at ease during my appointment. The care and attention to detail were outstanding, and my teeth have never felt better!',
      'imageUrl': 'assets/images/telemedicine/tele-img-2.png',
    },
    {
      'name': 'Ben John',
      'rating': 4.6,
      'date': '16/10/203',
      'comment':
          'Very professional and thorough. I appreciated the clear explanations and the focus on preventive care. Highly recommend!',
      'imageUrl': 'assets/images/telemedicine/tele-img-3.png',
    },
    {
      'name': 'Emma Clark',
      'rating': 4.6,
      'date': '16/10/203',
      'comment':
          'I had a great experience with Dr. [Dentist\'s Name]. The office is welcoming, and the staff is friendly. My treatment was quick and painless!',
      'imageUrl': 'assets/images/telemedicine/tele-img-4.png',
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
          padding: const EdgeInsets.only(left: 25).r,
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.close,
              color: Colors.grey,
              size: 30.w,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: double.infinity,
                height: 125.h,
                decoration: BoxDecoration(
                  color: AppUtil().textcolor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 35.w,
                    ),
                    CircleAvatar(
                      radius: 40.r,
                      backgroundImage: AssetImage(
                          'assets/images/telemedicine/tele-img-1.png'),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr Merin Jacob',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp),
                        ),
                        Text(
                          'Pediatrics',
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4.w),
                            Text(
                              '${4.6}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              ' | ${125} Reviews',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Bio',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "I'm Dr. Merin Jacob, a dedicated dentist passionate about providing exceptional dental care to patients of all ages. I focus on creating a comfortable and welcoming environment while offering personalized treatment plans. From preventative care to cosmetic and restorative dentistry, my goal is to help patients achieve and maintain healthy, beautiful smiles.",
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Experience',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "5+ years",
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Languages',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "English, German",
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Practicing at',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "Starlight General Hospital",
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Reviews',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return _buildReviewCard(reviews[index]);
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(PageRouteName.bookappoinment);
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
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(review['imageUrl']),
                radius: 24.r,
              ),
              SizedBox(width: 16.w),
              Text(
                review['name'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              SizedBox(width: 4),
              Text(
                '${review['rating']} | ${review['date']}',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            review['comment'],
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
