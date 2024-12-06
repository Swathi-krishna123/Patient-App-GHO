import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';

class ArticleDetail extends StatelessWidget {
  final String? imagepath;
  final String? articledescription;
  ArticleDetail({super.key})
      : imagepath = Get.arguments['imagepath'],
        articledescription = Get.arguments['articledescription'];

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
          'Article',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppUtil().h15,
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagepath!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AppUtil().h15,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jan 12, 2024',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '6 minutes ago',
                    style: TextStyle(color: AppUtil().textcolor),
                  ),
                ],
              ),
              AppUtil().h15,
              Text(
                articledescription!,
                style: TextStyle(fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
