import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
import '../../controller.dart/app_usercontroller.dart';
import '../../util/shared_prefences.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final AppUserController userController = Get.find<AppUserController>();
  final AppController controller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                ),
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: AppUtil().textcolor,
                    child: Center(
                      child: Text(
                        userController.userDetail.value!.FirstName
                            .toString()
                            .substring(0, 1)
                            .toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                AppUtil().h10,
                Center(child: Text('Welcome back')),
                AppUtil().h10,
                Center(
                    child: Obx(
                  () => Text(
                    "${userController.userDetail.value?.FirstName} ${userController.userDetail.value?.LastName}",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 20,
                        fontWeight: FontWeight.w600),
                  ),
                )),
                AppUtil().h15,
                Divider(
                  color: AppUtil().containerColor,
                ),
                AppUtil().h15,
                profileListTile(
                  icons: Icons.person_outline_rounded,
                  text: 'Personal Info',
                  ontap: () {
                    Get.toNamed(PageRouteName.editprofile);
                  },
                ),
                AppUtil().h15,
                profileListTile(
                    icons: Icons.lock_outline_rounded, text: 'Enable app lock'),
                AppUtil().h15,
                profileListTile(
                  icons: Icons.logout_rounded,
                  text: 'Logout',
                  ontap: () {
                    AppUtil().logoutalert(context);
                  },
                ),
                AppUtil().h10,
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector profileListTile(
      {String? text, IconData? icons, Function()? ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(231, 238, 255, 1),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.grey)]),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icons,
                color: AppUtil().textcolor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Default color
                ),
              ),
              Spacer(),
              text == 'Enable app lock'
                  ? Obx(
                      () => Switch(
                        inactiveTrackColor: AppUtil().containerColor,
                        activeColor: AppUtil().textcolor,
                        value: controller.isBioEnabled.value,
                        onChanged: (value) async {
                          controller.isBioEnabled.value = value;
                          await SharedPrefs.setBool(
                              controller.isBioEnabled.value,
                              SharedPrefs.ISBIOMETRICENABLED);
                        },
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
