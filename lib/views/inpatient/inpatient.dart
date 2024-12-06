import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inpatient extends StatelessWidget {
  Inpatient({super.key});
  final List<ServiceItem> services = [
    ServiceItem(
      title: "01 Visa Processing",
      description:
          "Assistance with visa applications and documentation for international travel.",
    ),
    ServiceItem(
      title: "02 Flight Services",
      description:
          "Booking and management of flight tickets for patients and accompanying persons.",
    ),
    ServiceItem(
      title: "03 Air Ambulance Services",
      description:
          "Emergency medical transportation by air for critical patients.",
    ),
    ServiceItem(
      title: "04 Appointment Booking",
      description:
          "Scheduling medical appointments with specialists and healthcare facilities.",
    ),
    ServiceItem(
      title: "05 Telehealth Services",
      description:
          "Remote healthcare services through video consultations and digital platforms.",
    ),
    ServiceItem(
      title: "06 Support Services",
      description:
          "Additional assistance including translation, accommodation, and local guidance.",
    ),
    ServiceItem(
      title: "07 Local Transportation",
      description:
          "Arranging ground transportation for patients and their families.",
    ),
    ServiceItem(
      title: "08 Translation Services",
      description:
          "Professional medical translation and interpretation services.",
    ),
    ServiceItem(
      title: "09 Bank Transfers & Settlements",
      description:
          "Handling of financial transactions and billing for medical services.",
    ),
    ServiceItem(
      title: "10 Accommodation Arrangements",
      description:
          "Booking suitable lodging for patients and accompanying persons.",
    ),
  ];
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
          'Inpatient Services',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
        ),
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
                        color: Color(0xFFE1D335),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Image.asset(
                          'assets/images/Inpatient Services Image.png',
                          fit: BoxFit.fitWidth,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'At Global Health Opinion',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Seamless Access To World-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Class Inpatient Care And ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Exceptional Support',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                        Text(
                          'Throughout Your Journey.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.035),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Inpatient Services',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ExpansionTile(
                      title: Text(
                        services[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Color(0xFFE1D335),
                          )),
                      collapsedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Color(0xFFE1D335),
                          )),
                      trailing: Icon(Icons.keyboard_arrow_down_rounded),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            services[index].description,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceItem {
  final String title;
  final String description;

  ServiceItem({required this.title, required this.description});
}
