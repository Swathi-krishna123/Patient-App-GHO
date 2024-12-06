import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/controller.dart/app_usercontroller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

import '../../util/routes.dart';

class HomePage extends StatefulWidget {
  final Function(int) onNavigate; // Callback function to change page index

  HomePage({super.key, required this.onNavigate});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppController controller = Get.put(AppController());
  final AppUserController userController =
      Get.put(AppUserController(), permanent: true);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 10),
                Text(
                  'Our Services',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: AppUtil().textcolor),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceCard(
                      'Second\nOpinion',
                      Color(0xFF449898),
                      context,
                      'assets/images/secondOpinion.png',
                      ontap: () {
                        widget.onNavigate(1);
                      },
                    ),
                    _buildServiceCard(
                      'Tele\nMedicine',
                      Color(0xFF449847),
                      context,
                      'assets/images/37536f0264047d9011adf53526be7739.png',
                      ontap: () {
                        widget.onNavigate(2);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildServiceCard(
                      'Peer\nReview',
                      Color(0xFF914498),
                      context,
                      'assets/images/ccba82e0085c7b922ed2b0f0d55cffe8.png',
                      ontap: () {
                        Get.toNamed(PageRouteName.peerreview);
                      },
                    ),
                    _buildServiceCard(
                      'US\nInPatient',
                      Color(0xFFE1D335),
                      context,
                      'assets/images/60a1bbbfa44eceaf59d6e27c715df6df.png',
                      ontap: () => Get.toNamed(PageRouteName.inpatient),
                    ),
                  ],
                ),
                AppUtil().h10,
                // Text(
                //   'Review Status',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontWeight: FontWeight.w700,
                //       fontSize: 25),
                // ),
                // SizedBox(height: 10),
                // _buildReviewStatus(context, onTap: () => widget.onNavigate(1)),
                AppUtil().h10,
                _buildMedicalReports(context),
                AppUtil().h10,
                _buildHealthArticles(context),
                AppUtil().h15,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                foregroundImage: AssetImage(
                  'assets/images/dummyprofile.jpeg',
                ),
                radius: 25.r,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 35),
            Obx(() => (Text(
                  'Welcome ${userController.userDetail.value?.FirstName}', // Ensure FirstName exists
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 25,
                      fontWeight: FontWeight.bold),
                ))),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(PageRouteName.notificationPage);
              },
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

  Widget _buildServiceCard(
      String title, Color color, BuildContext context, String backgroundimage,
      {Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.36,
        height: MediaQuery.of(context).size.height / 7,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                alignment: Alignment.topRight,
                fit: BoxFit.fitHeight,
                image: AssetImage(backgroundimage))),
        child: Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 30,
                top: MediaQuery.of(context).size.width / 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                SvgPicture.asset('assets/icons/forwardgridicon.svg')
              ],
            )),
      ),
    );
  }

  Widget _buildReviewStatus(BuildContext context, {Function()? onTap}) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height / 9, // Make this proportional to the screen height
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [Color(0xFFFF9011), Color(0xFF643806)]),

          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 12, // Fixed width for the orange bar
              height: height / 9,
              decoration: BoxDecoration(
                // color: Colors.grey.shade700,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.07, top: width * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Case ID: xxxxxxx',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04, // Font size proportional to width
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'Patient Name: John Smith',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    'Age: 45',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Spacer(), // To push the percentage widget to the right
            Padding(
              padding: EdgeInsets.only(top: width * 0.02, right: width * 0.05),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: width * 0.05, // Responsive radius
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Text(
                        '75%',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: width * 0.04,
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Text(
                    'Inprogress',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.04, // Responsive font size
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalReports(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF014EC4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'See Your Medical History At \nYour Fingertips',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                              child: Text(
                            'Connect to EMR',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )),
                        ),
                      ),
                      SizedBox(width: 10),
                      // Container(
                      //   width: MediaQuery.of(context).size.width / 4.5,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(4),
                      //       border: Border.all(color: Colors.white)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(6.0),
                      //     child: Center(
                      //         child: Text(
                      //       'Upload',
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: 12),
                      //     )),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.width / 4.5,
              child: SvgPicture.asset(
                'assets/images/homescreengrouptile.svg',
                fit: BoxFit.fitHeight,
              )),
          Positioned(
              left: 150,
              child: SvgPicture.asset(
                'assets/images/homescreentile2.svg',
                fit: BoxFit.cover,
              )),
          Positioned(
            top: 18,
            left: 26,
            child: Text('Access Your Medical Reports',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 22)),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: 150,
                child: Image.asset(
                  'assets/images/d9a17864f58bb100be995676e9263f4f-ai-brush-removebg-1e8sveiph.png',
                  fit: BoxFit.fitWidth,
                ),
              ))
        ],
      ),
    );
  }
}

Widget _buildHealthArticles(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Health Articles',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
          InkWell(
            onTap: () => Get.toNamed(PageRouteName.article),
            child: Text('See All',
                style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey)),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Expanded(
              child: _buildArticleCard(
            'Fitness',
            Color(0xFFCCACF5),
            context,
            ontap: () => Get.toNamed(PageRouteName.article),
          )),
          SizedBox(width: 10),
          Expanded(
              child: _buildArticleCard('Diet', Color(0xFFF0C895), context,
                  ontap: () => Get.toNamed(PageRouteName.article))),
        ],
      ),
    ],
  );
}

Widget _buildArticleCard(String title, Color color, BuildContext context,
    {Function()? ontap}) {
  DecorationImage? decorationImage;
  if (title == 'Diet') {
    decorationImage = DecorationImage(
      fit: BoxFit.fitWidth,
      image: AssetImage('assets/images/94363aaf48cecd681ae6b13757a180d3.png'),
    );
  }
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: MediaQuery.of(context).size.width / 2.36,
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        color: color,
        image: decorationImage,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          title == 'Fitness'
              ? Container(
                  width: MediaQuery.of(context).size.width / 4.5,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Image.asset(
                    'assets/images/efa1bee2dd5a0853e4abd605c3adb91c.png',
                    fit: BoxFit.fitHeight,
                  ))
              : SizedBox(),
          title == 'Diet'
              ? SizedBox(
                  width: 20,
                )
              : SizedBox(),
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              )),
        ],
      ),
    ),
  );
}
