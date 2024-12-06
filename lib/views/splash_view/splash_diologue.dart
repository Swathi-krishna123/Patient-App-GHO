import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/main.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

import '../../util/routes.dart';

class SplashDiologue extends StatelessWidget {
  const SplashDiologue({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width / 25,
            right: size.width / 25,
            top: size.height / 10,
            bottom: size.height / 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Image.asset(
                  'assets/images/Group 2642.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(
                'Your Second Opinion,\nSimplified.',
                style: TextStyle(
                    color: AppUtil().textcolor,
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width / 20,
                    right: size.width / 20,
                    top: size.height / 35),
                child: Text(
                  'Expert medical advice from top specialists, right at your fingertip.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x80014EC4),
                    fontSize: size.width / 27,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 35,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width / 25,
                  right: size.width / 25,
                ),
                child: splashScreenButtons(context,
                    () => Get.toNamed(PageRouteName.login), 'Get Started',
                    color: AppUtil().textcolor, textcolor: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  splashDiologueTerms(size, 'By signing up, you agree to our ',
                      Color(0xFF909090)),
                  splashDiologueTerms(
                      size, 'Terms and Conditions ', AppUtil().textcolor),
                  splashDiologueTerms(size, '& ', Color(0xFF909090)),
                  splashDiologueTerms(
                      size, 'Privacy Policy.', AppUtil().textcolor)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Text splashDiologueTerms(Size size, String titile, Color color) {
    return Text(
      titile,
      style: TextStyle(color: color, fontSize: size.width / 45),
    );
  }

  GestureDetector splashScreenButtons(
      BuildContext context, Function()? onTap, String title,
      {Color? color, BoxBorder? boxBorder, Color? textcolor}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 18,
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
            title,
            style: TextStyle(
              color: textcolor,
              fontSize: MediaQuery.of(context).size.width / 27,
            ),
          ),
        ),
      ),
    );
  }
}
