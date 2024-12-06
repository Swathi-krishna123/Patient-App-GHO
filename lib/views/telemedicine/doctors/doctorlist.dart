import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';

class Doctorlist extends StatelessWidget {
  Doctorlist({super.key});
  String? selectedLocation;
  String? selectedHospital;
  List<String> locations = [
    'Kochi/Kerala/India',
    'Mumbai/Maharashtra/India',
    'Delhi/Delhi/India'
  ];
  List<String> hospitals = [
    'VPS Lakeshore',
    'Apollo Hospitals',
    'Fortis Healthcare'
  ];

  List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. John Martin',
      'specialty': 'Dentist',
      'rating': 4.5,
      'reviews': 125
    },
    {
      'name': 'Dr. Thomas Edison',
      'specialty': 'Dentist',
      'rating': 4.3,
      'reviews': 98
    },
    {
      'name': 'Dr. Selin Mark',
      'specialty': 'Dentist',
      'rating': 4.7,
      'reviews': 156
    },
    {
      'name': 'Dr. Benchamin Charles',
      'specialty': 'Dentist',
      'rating': 4.4,
      'reviews': 112
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
          'Your Prescriptions',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.h,
              ),
              _buildDropdown(
                hint: 'Select Location',
                value: selectedLocation,
                items: locations,
                onChanged: (value) {
                  selectedLocation = value;
                },
              ),
              SizedBox(height: 16),
              _buildDropdown(
                  hint: 'Select Hospital',
                  value: selectedHospital,
                  items: hospitals,
                  onChanged: (value) {
                    selectedHospital = value;
                  }),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Available Doctors',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () => Get.toNamed(PageRouteName.doctordetail),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          border: Border(
                            right: BorderSide.none,
                            left: BorderSide(
                                color: AppUtil().textcolor, width: 8.w),
                          ),
                        ),
                        child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/telemedicine/tele-img-1.png'),
                              radius: 25,
                            ),
                            title: Text(doctor['name'],
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctor['specialty']),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    Text(
                                        ' ${doctor['rating']} | ${doctor['reviews']} Reviews'),
                                  ],
                                ),
                              ],
                            ),
                            trailing: SvgPicture.asset(
                                'assets/icons/arrow_right.svg')),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppUtil().containerColor),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint),
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          icon: SvgPicture.asset(
            'assets/icons/arrow_down.svg',
            width: 24.w,
            height: 24.h,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
