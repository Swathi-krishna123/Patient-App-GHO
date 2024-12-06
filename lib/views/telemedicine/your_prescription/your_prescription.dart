import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

class YourPrescription extends StatelessWidget {
  YourPrescription({super.key});

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
          'Your Prescriptions',
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
                    hintText: 'Search',
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var name = [
                    'John Smith',
                    'Tom Smith',
                    'Renjith Shyam',
                    'Serina Smith',
                    'Alina Jacob',
                    'Ben Smith',
                    'Ben Smith'
                  ];
                  var age = ['34', '56', '47', '22', '24', '18', '22'];
                  var gender = [
                    'Male',
                    'Male',
                    'Male',
                    'Female',
                    'Female',
                    'Male',
                    'Male'
                  ];
                  var date = [
                    'Sep 3, 2024',
                    'Aug 9, 2024',
                    'Dec 22, 2024',
                    'Jan 18, 2024',
                    'Mar 26, 2024',
                    'Jun 8, 2024',
                    'May 28, 2024'
                  ];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.r),
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Diagnosis/Condition',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          name[index],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 4.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Age: ${age[index]} | Gender: ${gender[index]}',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              date[index],
                                              style:
                                                  TextStyle(color: Colors.grey),
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
