import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
import 'package:lottie/lottie.dart';

class CaseSuccesspage extends StatelessWidget {
  const CaseSuccesspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                color: AppUtil().containerColor,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                  child: Lottie.asset(
                    'assets/icons/Animation - 1732869973856.json',
                  ),
                ),
                Text(
                  'Case Recieved!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                AppUtil().h10,
                Text(
                  'Our team of experts is on it. You’ll hear from us soon with a thorough second opinion to guide your next steps.',
                  textAlign: TextAlign.center,
                ),
                AppUtil().h10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Review ID:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      ' XXXX',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
                AppUtil().h5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Transaction ID:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      ' XXXXXXXX',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    )
                  ],
                ),
                AppUtil().h15,
                GestureDetector(
                  onTap: () async {
                    Get.offAllNamed(PageRouteName.mainpage);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
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
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 25,
                      ),
                    )),
                  ),
                ),
                AppUtil().h15
              ],
            ),
          ),
        ),
      ),
    );
  }
}
