import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../util/routes.dart';

class BookAppointment extends StatelessWidget {
  BookAppointment({super.key});
  final List<String> timeSlots = [
    '11:00 AM',
    '11:30 AM',
    '02:00 PM',
    '02:20 PM',
    '03:15 PM',
    '03:45 PM',
    '05:00 PM',
    '05:30 PM',
  ];
  final AppController controller = Get.find();

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
              Obx(() => Container(
                    decoration: BoxDecoration(
                      color: AppUtil().backgroundcolor,
                      borderRadius: BorderRadius.circular(12),
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
                  )),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Select Time Slot on September 16',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  return Obx(() => ElevatedButton(
                        onPressed: () {
                          controller.selectedTimeSlot.value = timeSlots[index];
                        },
                        child: Text(timeSlots[index]),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.selectedTimeSlot.value ==
                                  timeSlots[index]
                              ? AppUtil().textcolor
                              : Colors.white,
                          foregroundColor: controller.selectedTimeSlot.value ==
                                  timeSlots[index]
                              ? Colors.white
                              : AppUtil().textcolor,
                          side: BorderSide(color: AppUtil().textcolor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ));
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(PageRouteName.patientlistforappointment);
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
                    'Book Appointment',
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
