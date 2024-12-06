import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/util/constant.dart';
import 'package:google_fonts/google_fonts.dart';

class PeerReview extends StatelessWidget {
  const PeerReview({super.key});

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
        centerTitle: false,
        title: Text(
          'Peer Review',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 5,
                    decoration: BoxDecoration(
                        color: Color(0xFF914498),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image.asset(
                          'assets/images/Peer Review Image.png',
                          fit: BoxFit.fitHeight,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'At Global Health Opinion',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Top-Tier Medical Care With Peer',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Reviews, Second Opinions, Multi-',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Speaciality Reviews And Board',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Evaluations From Our Global',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Network of Specialists.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                'Peer Review Services',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.98,
                  crossAxisCount: 2,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  var title = [
                    'Global\nExpertise:',
                    'Objective\nAssessments:',
                    'Quality\nAssurance:',
                    'Error\nIdentification:'
                  ];
                  var subtitle = [
                    'Access To A\nNetwork Of Top\nSpecialists\nworldwide.',
                    'Independent\nEvaluation Of\nDiagnosis And\nTreatment Plans.',
                    'Ensure\nAdherence To\nGlobal Medical\nStandards.',
                    'Helps Prevent\nAdverse\nOutcomes And\nImprove Care.'
                  ];

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF914498),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '0${index + 1}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),

                                        maxLines:
                                            2, // Ensures proper text wrapping
                                        overflow: TextOverflow
                                            .ellipsis, // Avoid overflow
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        subtitle[index],
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035,
                                        ),
                                        maxLines: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              Text('Why Choose Us?',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20)),
              SizedBox(
                height: 10,
              ),
              _buildBulletPoint('Patient-Centered Approach: ',
                  'We prioritize your needs and well-being.'),
              SizedBox(
                height: 10,
              ),
              _buildBulletPoint('Comprehensive Reviews: ',
                  'Get a thorough evaluation of your medical case.'),
              SizedBox(
                height: 10,
              ),
              _buildBulletPoint('Global Network: ',
                  'Benefit from expertise from around the world.'),
              SizedBox(
                height: 10,
              ),
              _buildBulletPoint('Confidentiality: ',
                  'Your medical information is treated with the utmost privacy'),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.only(top: 6, right: 8),
          decoration: BoxDecoration(
            color: AppUtil().textcolor,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(
                  text: '$title ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppUtil().textcolor,
                      fontFamily: GoogleFonts.lato().fontFamily),
                ),
                TextSpan(
                    text: description,
                    style:
                        TextStyle(fontFamily: GoogleFonts.lato().fontFamily)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
