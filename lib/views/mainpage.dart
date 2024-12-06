import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_createreviewcontroller.dart';
import 'package:global_health_opinion_sample/views/home_page/homepage.dart';
import 'package:global_health_opinion_sample/views/new_reviews/create_new_review.dart';
import 'package:global_health_opinion_sample/views/profile_view/profile_view.dart';
import 'package:global_health_opinion_sample/views/telemedicine/telemedicine.dart';

import '../util/constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CreateReviewController controller = Get.put(CreateReviewController());
  int currentIndex = 0;
  bool hasPressedBackOnce = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await controller.getAllCasesList();
  }

  void setPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomePage(onNavigate: setPage),
      CreateNewReview(),
      Telemedicine(),
      ProfileView(),
    ];

    return PopScope(
      canPop: hasPressedBackOnce,
      onPopInvokedWithResult: (didPop, result) {
        if (!hasPressedBackOnce) {
          hasPressedBackOnce = true;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              content: Row(
                children: [
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/playstore.png',
                          fit: BoxFit.cover,
                        ),
                      )),
                  SizedBox(width: 5),
                  Text("Press again to exit"),
                ],
              ),
              duration: Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 20,
                  left: MediaQuery.of(context).size.width / 4,
                  right: MediaQuery.of(context).size.width / 4),
            ),
          );
          Future.delayed(Duration(seconds: 2), () {
            hasPressedBackOnce = false;
          });
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          selectedItemColor: AppUtil().textcolor,
          selectedIconTheme: IconThemeData(color: AppUtil().textcolor),
          onTap: setPage,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomnavhome.svg',
                color: currentIndex == 0 ? AppUtil().textcolor : Colors.grey,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomnavmyreview.svg',
                color: currentIndex == 1 ? AppUtil().textcolor : Colors.grey,
              ),
              label: 'My Reviews',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomnavtele.svg',
                color: currentIndex == 2 ? AppUtil().textcolor : Colors.grey,
              ),
              label: 'Telemedicine',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/bottomnavprofile.svg',
                color: currentIndex == 3 ? AppUtil().textcolor : Colors.grey,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
