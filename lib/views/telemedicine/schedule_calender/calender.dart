import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  Calender({super.key});

  final AppController controller = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          'Calender',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppUtil().backgroundcolor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: controller.focusedDay.value,
                      calendarFormat: controller.calendarFormat.value,
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.selectedDay.value, day);
                      },
                      onDaySelected: (
                        selectedDay,
                        focusedDay,
                      ) {
                        controller.selectedDay.value = selectedDay;
                        controller.focusedDay.value = focusedDay;
                      },
                      onFormatChanged: (format) {
                        controller.calendarFormat.value = format;
                      },
                      onPageChanged: (focusedDay) {
                        controller.focusedDay.value = focusedDay;
                      },
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: Color.fromRGBO(73, 135, 255, 0.25),
                          shape: BoxShape.circle,
                        ),
                        todayTextStyle: TextStyle(
                            color: AppUtil().textcolor,
                            fontWeight: FontWeight.w600),
                        selectedTextStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                        selectedDecoration: BoxDecoration(
                          color: AppUtil().textcolor,
                          shape: BoxShape.circle,
                        ),
                        outsideDaysVisible: true,
                        outsideTextStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        leftChevronIcon: Icon(Icons.chevron_left),
                        rightChevronIcon: Icon(Icons.chevron_right),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                        weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: double.infinity,
              height: 600.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    width: 100.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  _buildAppointmentsList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsList() {
    return ListView.separated(
      itemBuilder: (context, index) {
        var doctorname = ["Dr. Merin Jacob", "Dr. Sunny Kurian"];
        var specialities = ["Pediatrics", "Dermatologist"];
        return Container(
          padding: EdgeInsets.all(16.r),
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage:
                    AssetImage('assets/images/telemedicine/tele-img-1.png'),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorname[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.sp),
                    ),
                    Text(
                      specialities[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calender.svg',
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '10:45 am',
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/clockicon.svg',
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'September 15',
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(PageRouteName.doctordetail);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppUtil().textcolor,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
                    child: Center(
                      child: Text(
                        'Join Call',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: 2,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.r),
    );
  }
}
