import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:global_health_opinion_sample/util/routes.dart';
// import 'package:global_health_opinion_sample/views/article/article_detail.dart';

class Article extends StatelessWidget {
  Article({super.key});
  final TextEditingController searchcontroller = TextEditingController();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 25, right: 25),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.grey),
            //     ),
            //     child: TextFormField(
            //       controller: searchcontroller,
            //       cursorColor: AppUtil().textcolor,
            //       decoration: InputDecoration(
            //         prefixIcon: Icon(
            //           CupertinoIcons.search,
            //           color: Colors.grey,
            //         ),
            //         hintText: 'Search',
            //         hintStyle: TextStyle(color: Colors.grey),
            //         enabledBorder: InputBorder.none,
            //         focusedBorder: InputBorder.none,
            //         contentPadding: EdgeInsets.all(12),
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.only(left: 25),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 35.h,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       physics: AlwaysScrollableScrollPhysics(),
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 3,
            //       padding: EdgeInsets.all(0),
            //       itemBuilder: (context, index) {
            //         var label = ['Diet', 'Fitness', 'Covid-19'];
            //         return Padding(
            //           padding: const EdgeInsets.only(right: 10),
            //           child: Container(
            //             decoration: BoxDecoration(
            //               color: Color(0xFF336EBD),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.only(
            //                   left: 35, right: 35, top: 5, bottom: 5),
            //               child: Center(
            //                 child: Text(
            //                   label[index],
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize:
            //                           MediaQuery.of(context).size.width / 28),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: _buildSectionHeader('Popular Articles'),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxWidth < 420
                      ? MediaQuery.of(context).size.width / 1.36
                      : MediaQuery.of(context).size.width / 1.6,
                  child: ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var images = [
                          'assets/images/Article img 1.png',
                          'assets/images/Article img 2.png',
                        ];
                        var titleLabels = [
                          'Disease Management',
                          'Healthcare Practice'
                        ];
                        var descriptions = [
                          "An insightful article on disease management that highlights strategies and approaches for managing chronic illnesses effectively. It covers the importance of patient education, regular monitoring, and coordinated care among healthcare providers. The article emphasizes personalized treatment plans and lifestyle modifications to enhance patient outcomes and improve quality of life",
                          "This article on healthcare practice examines the principles and standards that guide healthcare professionals in delivering quality care. It discusses the roles of evidence-based medicine, patient-centered care, and ethical considerations in clinical decision-making. The piece also highlights the importance of continuous education and collaboration among healthcare teams to improve patient safety and treatment efficacy.",
                        ];
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(PageRouteName.articleDetail,
                                  arguments: {
                                    'imagepath': images[index],
                                    'articledescription': descriptions[index],
                                  });
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width /
                                  2, // Use FractionallySizedBox for more responsive width
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image Section
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: AspectRatio(
                                      // AspectRatio will make the image responsive
                                      aspectRatio: 16 /
                                          9, // Adjust aspect ratio based on your design
                                      child: Image.asset(
                                        images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // Text Section
                                  Text(
                                    titleLabels[index],
                                    style: TextStyle(
                                      color: AppUtil().textcolor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    descriptions[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 10),
                                  // Row with dates
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jan 12, 2024',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        '6 minutes ago',
                                        style: TextStyle(
                                            color: AppUtil().textcolor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: _buildSectionHeader('Articles On The Topic'),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InkWell(
                onTap: () {
                  Get.toNamed(PageRouteName.articleDetail, arguments: {
                    'imagepath': 'assets/images/Article img 3.png',
                    "articledescription":
                        'The Future of Telemedicine: Bridging Gaps in Global Healthcare',
                  });
                },
                child: _buildTopicArticle(
                  'The Future of Telemedicine: Bridging Gaps in Global Healthcare',
                  'assets/images/Article img 3.png',
                  '10 minutes ago',
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InkWell(
                onTap: () {
                  Get.toNamed(PageRouteName.articleDetail, arguments: {
                    "imagepath": 'assets/images/Article img 4.png',
                    "articledescription":
                        'Empathy in Healthcare: The Key to improved Patient Outcomes',
                  });
                },
                child: _buildTopicArticle(
                  'Empathy in Healthcare: The Key to improved Patient Outcomes',
                  'assets/images/Article img 4.png',
                  '30 minutes ago',
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: InkWell(
                onTap: () {
                  Get.toNamed(PageRouteName.articleDetail, arguments: {
                    "imagepath": 'assets/images/Article img 5.png',
                    "articledescription":
                        'Virtual Health Assistans: How AI is Shaping the Future of Healthcare.',
                  });
                },
                child: _buildTopicArticle(
                  'Virtual Health Assistans: How AI is Shaping the Future of Healthcare.',
                  'assets/images/Article img 5.png',
                  '2 minutes ago',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF336EBD),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 5, bottom: 5),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        // Text(
        //   'See All',
        //   style: TextStyle(
        //       color: Colors.grey,
        //       decoration: TextDecoration.underline,
        //       decorationColor: Colors.grey),
        // ),
      ],
    );
  }

  Widget _buildPopularArticle(
      String category, String title, String imageUrl, String time) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicArticle(String title, String imageUrl, String time) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageUrl,
            width: 150,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Jan 12, 2024',
                      style: TextStyle(
                          color: Colors.grey, overflow: TextOverflow.clip),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      time,
                      style: TextStyle(
                          color: AppUtil().textcolor,
                          overflow: TextOverflow.clip),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/article_save.svg'))
      ],
    );
  }
}
